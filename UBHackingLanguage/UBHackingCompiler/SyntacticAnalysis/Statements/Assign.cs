using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using UBHackingCompiler.SyntacticAnalysis.Definitions;
using UBHackingCompiler.SyntacticAnalysis.Expression;

namespace UBHackingCompiler.SyntacticAnalysis.Statements
{
    public class Assign:Stmt
    {
        public LogicNode value;
        public new static Assign Match()
        {
            var let=new Assign();
            Parser.Match(Tag.LET);
            var name = Parser.current.tag_value.ToString();
            Parser.Match(Tag.ID);
            Parser.Match('=');

            let.value = BoolTree.Match();
            Parser.Match(';');
            return let;
        }
    }
}
