using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace UBHackingCompiler.SyntacticAnalysis.Definitions
{
    public class Identitifer
    {
        public string ILValue;

        public Identitifer(string v)
        {
            ILValue = v;
        }
        public static Identitifer Match()
        {
            var id=new Identitifer("");
            while (true)
            {
                if (Parser.current.tag_value == Tag.ID)
                {
                    id.ILValue += Parser.current.ToString();
                    Parser.Match(Tag.ID);
                    continue;
                }

                if (Parser.current.tag_value == Tag.FLOAT)
                {
                    id.ILValue += Parser.current.ToString();
                    Parser.Match(Tag.FLOAT);
                    continue;
                }

                if (Parser.current.tag_value == Tag.INT)
                {
                    id.ILValue += Parser.current.ToString();
                    Parser.Match(Tag.INT);
                    continue;
                }
                if (Parser.current.tag_value == '.')
                {
                    Parser.Match('.');
                    id.ILValue += ".";
                    continue;
                }

                if (Parser.current.tag_value == ':')
                {
                    Parser.Match(':');
                    Parser.Match(':');
                    id.ILValue += "::";
                    continue;
                }
                break;
            }

            return id;
        }
    }
}
