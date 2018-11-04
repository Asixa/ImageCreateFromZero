using System;
using System.Collections.Generic;
using UBHackingCompiler.Generator;
using UBHackingCompiler.SyntacticAnalysis.Statements;
using  static UBHackingCompiler.SyntacticAnalysis.Parser;
namespace UBHackingCompiler.SyntacticAnalysis.Definitions
{
    public class Class : Stmt
    {


        //实例参数
        public bool isPublic, isStatic;
        public string name;
        public List<Func> functions = new List<Func>();
        public List<Field>fields=new List<Field>();

        public string fullname;
        public static Class Match(NameSpace name_space)
        {
      
            var obj = new Class();
         
            Parser.Match(Tag.OBJ);
            Parser.Match('<');
            if (current.tag_value == Tag.PUBLIC)
            {
                obj.isPublic = true;
                Parser.Match(Tag.PUBLIC);
                if (current.tag_value == '|')
                {
                    Parser.Match('|');
                    if (current.tag_value == Tag.STATIC)
                    {
                        obj.isStatic = true;
                        Parser.Match(Tag.STATIC);
                    }
                }
            }

            Parser.Match('>');
            obj.name = current.ToString();
            Parser.Match(Tag.ID);
            Parser.Match('{');
            while (current.tag_value == Tag.VAR) obj.fields.Add(Field.Match());
            while (current.tag_value == Tag.FUNC) obj.functions.Add(Func.Match(obj));
            Parser.Match('}');
            return obj;
        }

        public void Create(NameSpace name_space)
        {
            ILGen.AddLine(".class public auto ansi beforefieldinit");
            ILGen.AddLine(name_space.name+"."+name);
            ILGen.AddLine("extends [mscorlib]System.Object");
            ILGen.AddLeftBrace();

            for (int i = 0; i < fields.Count; i++)
            {
                ILGen.AddLine(".field "+(fields[i].isPublic?"public ":"private ")+(fields[i].isStatic?"static ":" ") + "literal "+ fields[i].type+" "+fields[i].name);
            }

            foreach (var t in functions) t.Create(this);
            ILGen.AddLine("  .method public hidebysig specialname rtspecialname instance void");
            ILGen.AddLine("   .ctor() cil managed ");
           
            ILGen.AddLeftBrace();
            ILGen.ILNumber = 0;
            ILGen.preserved = new List<int>();
            ILGen.AddLine(".maxstack 8");

            for (int i = 0; i < fields.Count; i++)
            {
                void Set()
                {
                    switch (fields[i].type)
                    {
                        case "float32":
                            ILGen.AddInstruct(Instruction.ldc_r4, fields[i].value.Replace("f", ""));
                            break;
                        //TODO
                    }
                }

                if (fields[i].isStatic)
                {
                    Set();
                    ILGen.AddInstruct(Instruction.stsfld,fields[i].type+" "+name_space.name+"."+name+"::"+fields[i].name);

                }
                else
                {
                    ILGen.AddInstruct(Instruction.ldarg_0);
                    Set();
                    ILGen.AddInstruct(Instruction.stfld,
                        fields[i].type + " " + name_space.name + "." + name + "::" + fields[i].name);
                }
            }
            ILGen.AddInstruct(Instruction.ret);

            ILGen.AddRightBrace();
            ILGen.AddRightBrace();
        }
    }
}
