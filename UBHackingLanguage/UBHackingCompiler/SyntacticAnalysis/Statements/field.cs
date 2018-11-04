using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Remoting.Messaging;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using UBHackingCompiler.Generator;
using UBHackingCompiler.SyntacticAnalysis.Definitions;

namespace UBHackingCompiler.SyntacticAnalysis.Statements
{
    public class Field:Stmt
    {
        public string name;
        public string type;
        public string value;
        public bool isPublic = false,isStatic=false;
        public static Field Match()
        {
            var v=new Field();
            Parser.Match(Tag.VAR);
            v.name = Parser.current.ToString();
            Parser.Match(Tag.ID);
            Parser.Match(Tag.AS);
            v.type=  Parser.current.ToString();
            Parser.Match(Tag.ID);
            Parser.Match('(');
            v.value = Identitifer.Match().ILValue;
            Parser.Match(')');
            if (Parser.current.tag_value == '<')
            {
                Parser.Match('<');
                if (Parser.current.tag_value == Tag.PRIVATE)Parser.Match(Tag.PRIVATE);
                else if (Parser.current.tag_value == Tag.PUBLIC)
                {
                    Parser.Match(Tag.PUBLIC);
                    v.isPublic = true;
                }

                if (Parser.current.tag_value == '|')
                {
                    Parser.Match('|');
                    if (Parser.current.tag_value == Tag.STATIC)
                    {
                        Parser.Match(Tag.STATIC);
                        v.isStatic = true;
                    }
                }
                Parser.Match('>');

            }
            Parser.Match(';');
            return v;
        }

        public override void Create()
        {
            ILGen.AddLine(".field"+(isPublic?"public":"private"+" "
                +(isStatic?"static ":" "))+type+" "+name);

        }
    }
}
