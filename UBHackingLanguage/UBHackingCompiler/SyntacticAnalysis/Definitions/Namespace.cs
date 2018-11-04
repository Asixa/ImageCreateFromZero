using System;
using System.Collections.Generic;
using static UBHackingCompiler.SyntacticAnalysis.Parser;
namespace UBHackingCompiler.SyntacticAnalysis.Definitions
{
    public class NameSpace : Stmt
    {
        public string name;
        public List<Class> objs = new List<Class>();

        public new static NameSpace Match()
        {
            var space = new NameSpace();
            Parser.Match(Tag.NAMESPACE);
            space.name = Identitifer.Match().ILValue;

            if (Parser.current.tag_value == '=')
            {
                Parser.Match('=');
                Parser.Match('>');
                space.objs.Add(Class.Match(space));
            }
            else
            {
                Parser.Match('{');
                while (current.tag_value == Tag.OBJ) space.objs.Add(Class.Match(space));
                Parser.Match('}');
            }

            return space;
        }

        public void Create()
        {
            foreach (var obj in objs) obj.Create(this);
        }
    }
}
