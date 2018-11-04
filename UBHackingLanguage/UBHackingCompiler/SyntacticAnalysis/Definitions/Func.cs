using System;
using System.Collections.Generic;
using System.Reflection;
using System.Reflection.Emit;
using UBHackingCompiler.Generator;
using UBHackingCompiler.SyntacticAnalysis.Statements;
using static UBHackingCompiler.SyntacticAnalysis.Parser;
namespace UBHackingCompiler.SyntacticAnalysis.Definitions
{
    public class Func : Stmt
    {
        public struct Param
        {
            public Identitifer type;
            public string name;
        }
        public bool isPublic,isStatic;
        public string name;
        public Identitifer returnType;
        public Stmt block;
        public List<Param> _params = new List<Param>();


        public static Func Match(Class obj)
        {
            var function = new Func();
            Parser.Match(Tag.FUNC);
            Parser.Match('<');
            if (current.tag_value == Tag.PUBLIC)
            {
                function.isPublic = true;
                Parser.Match(Tag.PUBLIC);
                if (current.tag_value == '|')
                {
                    Parser.Match('|');
                    if (current.tag_value == Tag.STATIC)
                    {
                        function.isStatic = true;
                        Parser.Match(Tag.STATIC);
                    }
                }
            }
            Parser.Match('>');
            function.name = current.ToString();
            Parser.Match(Tag.ID);
            Parser.Match('[');
            if (Parser.current.tag_value == ']')
            {
                function.returnType=new Identitifer("Void");
            }
            else
            {


                if (current.tag_value == Tag.BASIC || current.tag_value == Tag.ID)
                {
                    function.returnType = Identitifer.Match();
                }
                else function.returnType = new Identitifer("void");

                Parser.Match('|');
                if (current.tag_value == Tag.BASIC || current.tag_value == Tag.ID)
                {
                    function._params.Add(match_param());
                    while (current.tag_value == ',')
                    {
                        Parser.Match(',');
                        function._params.Add(match_param());
                    }
                }
            }

            Parser.Match(']');
            if (current.tag_value == '=')
            {
                Parser.Match('=');
                function.block=OneLineFunction.Match();
                Parser.Match(';');
            }
            else
            {
                Parser.Match('{');
                function.block = Stmts.Match();
                Parser.Match('}');
            }

            return function;
        }
        private static Param match_param()
        {
            var param = new Param
            {
                name = Identitifer.Match().ILValue,
            };
            Parser.Match(Tag.AS);
            param.type = Identitifer.Match();
            return param;
        }
        public void Create(Class obj)
        {
            ILGen.current_func = this;
            ILGen.AddLine(".method public hidebysig static "+returnType.ILValue);
            ILGen.AddLine(name+"(");
            for (var index = 0; index < _params.Count; index++)
            {
                var t = _params[index];
                ILGen.AddLine(t.type.ILValue + " " + t.name + (_params.Count == 1 ||index==_params.Count-1 ? "" : ","));
            }

            ILGen.AddLine(") cil managed");
            ILGen.AddLeftBrace();
            ILGen.AddLine(".maxstack 8");
            ILGen.ILNumber = 0;
            ILGen.preserved=new List<int>();
//            ILGen.AddLine(".locals init(");
//
//            ILGen.AddLine(")");
            block.Create();
            ILGen.AddRightBrace();
        }
    }
}
