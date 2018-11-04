using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using UBHackingCompiler.Generator;
using UBHackingCompiler.SyntacticAnalysis.Definitions;
using UBHackingCompiler.SyntacticAnalysis.Statements;
using UBHackingCompiler.Tokenize;
using Type = UBHackingCompiler.Tokenize.Type;
using static UBHackingCompiler.Debug.Debugger;
namespace UBHackingCompiler.SyntacticAnalysis.Expression
{
    public class Factor : LogicNode
    {
        private Factor(Token tok, Type type) : base(tok, type)
        {
        }

        public Factor(int i) : base(new Int(i), Type.Int)
        {
        }

        private static readonly Factor
            True = new Factor(Word.True, Type.Bool), False = new Factor(Word.False, Type.Bool);

        public static LogicNode Match()
        {
            LogicNode factor;
            switch (Parser.current.tag_value)
            {
                case Tag.INT:
                    factor = new Factor(Parser.current, Type.Int);
                    break;
                case Tag.FLOAT:
                    factor = new Factor(Parser.current, Type.Float);
                    break;
                case Tag.TRUE:
                    factor = True;
                    break;
                case Tag.FALSE:
                    factor = False;
                    break;
                case Tag.STRING:
                    factor = new Factor(Parser.current, Type.String);
                    break;
                case '(':
                    Parser.Move();
                    factor = BoolTree.Match();
                    Parser.Match(')');
                    return factor;
                case '#':
                    return new RightShift(Parser.current,Type.Void);
                case Tag.ID:
                    var tok = Parser.current;
                    var name = Identitifer.Match();
                    if (name.ILValue == "HEX")return new Hex(tok, Type.Void);
                    
                    else if (Parser.current.tag_value == '['||Parser.current.tag_value=='^')
                    {
                        return new FunCall(name,tok,Type.Void);
                    }
                    else
                    {
                        return  new variable(name, tok, Type.Void);
                    }
                    //return null;
//                    var tok = Parser.current;
//                    var identitifer = Type.Match();
//                    var variable = Top.Get(Parser.current);
//                    if (variable == null)
//                        Error(Parser.current + " UnknownVariable");
//                    Parser.Move();
//                    return new Factor(tok, identitifer.Check());
                default:
                    Error("GrammarError" + " " + Parser.current);
                    return null;
            }

            Parser.Move();
            return factor;
        }
    }

    public class FunCall : LogicNode
    {
        Identitifer funcName, returnType;
        public bool isSystemFunction;
        public List<LogicNode> value=new List<LogicNode>();
        public List<Identitifer> arguments=new List<Identitifer>();
        public FunCall(Identitifer name,Token tok, Type type) : base(tok, type)
        {
            funcName = name ?? Identitifer.Match();
            if (Parser.current.tag_value == '^')
            {
                Parser.Match('^');
                isSystemFunction = true;
            }
            Parser.Match('[');
            returnType = Identitifer.Match();
            if (Parser.current.tag_value == '|')
            {
                Parser.Match('|');
                arguments.Add(Identitifer.Match());
                while (Parser.current.tag_value==',')
                {
                    Parser.Match(',');
                    arguments.Add(Identitifer.Match());
                }
            }
            Parser.Match(']');
            Parser.Match('(');
            if (Parser.current.tag_value == Tag.ID)
            {
                value.Add(BoolTree.Match());
                while (Parser.current.tag_value == ',')
                {
                    Parser.Match(',');
                    value.Add(BoolTree.Match());
                }
            }

            Parser.Match(')');
        }

        public override void Create()
        {
            //foreach (var v in value)v.Create();
            
            if (funcName.ILValue == "CAST")
            {
                foreach (var v in value) v.Create();
                switch (returnType.ILValue)
                {
                    case "float32":ILGen.AddInstruct(Instruction.conv_r4);return;
                    case "float64":ILGen.AddInstruct(Instruction.conv_r8);return;
                }
            }

            else if (funcName.ILValue == "COND")
            {
                var b = value[0] as BoolTree;
       
               
                b.left.Create();
         
                b.right.Create();
                var c1 = ILGen.ILNumber + 1;
                var c2 = ILGen.ILNumber + 2;
                ILGen.AddPreserved(c1);
                ILGen.AddPreserved(c2);

         
                switch (b.Op.ToString())
                {
                    case ">":
                        ILGen.AddInstruct(Instruction.bgt_s,ILGen.GetILNumber(c1));break;
                    case "<":
                        ILGen.AddInstruct(Instruction.blt_s, ILGen.GetILNumber(c1));break;
                    case "<=":
                        ILGen.AddInstruct(Instruction.ble_s, ILGen.GetILNumber(c1));
                        break;
                    case ">=":
                        ILGen.AddInstruct(Instruction.bge_s, ILGen.GetILNumber(c1));
                        break;
                    case "==":
                        ILGen.AddInstruct(Instruction.beq_s, ILGen.GetILNumber(c1));
                        break;
                    case "!=":
                        ILGen.AddInstruct(Instruction.bne_s, ILGen.GetILNumber(c1));
                        break;
                }

                value[2].Create();
                ILGen.AddInstruct(Instruction.br_s,ILGen.GetILNumber(c2));
                ILGen.UsePreserverd(c1);
                value[1].Create();
                ILGen.UsePreserverd(c2);
                ILGen.AddInstruct(Instruction.nop);
            }
            else
            {
                foreach (var v in value) v.Create();
                var paramtypes = "";
                foreach (var a in arguments) paramtypes += a.ILValue + ",";
                paramtypes = paramtypes.Remove(paramtypes.LastIndexOf(",", StringComparison.Ordinal), 1);
                ILGen.AddInstruct(Instruction.call,
                    returnType.ILValue + " " + (isSystemFunction ? "[mscorlib]" : "") + funcName.ILValue + "(" +
                    paramtypes + ")");

            }



        }
    }

    public class variable : LogicNode
    {
        public Identitifer Name;

        public variable(Identitifer name, Token tok, Type type) : base(tok, type)
        {
           Name = name;
        }

        public override void Create()
        {
            var index = -1;
            var type = "";
            for (var i = 0; i < ILGen.current_func._params.Count; i++)
                if (ILGen.current_func._params[i].name == Name.ILValue)
                {
                    type = ILGen.current_func._params[i].type.ILValue;
                    index = i;
                }

            Instruction instruction;
//            switch (type)
//            {
//                case "float32": instruction = Instruction.ldc_r4;break;
//                //TODO    
//            }

            ILGen.AddInstruct("ldarg."+(index));
        }
    }

    public class RightShift : LogicNode
    {
        public Identitifer Name;
        public string value;
        public RightShift( Token tok, Type type) : base(tok, type)
        {
            Parser.Match('#');
            Parser.Match('>');
            Name = Identitifer.Match();
            Parser.Match('>');
            value = Parser.current.ToString();
            Parser.Match(Tag.INT);
        }
    }
    public class Hex : LogicNode
    {
        public string value;

        public Hex(Token tok, Type type) : base(tok, type)
        {
            Parser.Match('(');
            value = Identitifer.Match().ILValue;
            Parser.Match(')');
        }
    }
}
