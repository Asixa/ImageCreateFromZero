using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using UBHackingCompiler.SyntacticAnalysis.Definitions;
using UBHackingCompiler.SyntacticAnalysis.Expression;

namespace UBHackingCompiler.SyntacticAnalysis.Statements
{
    class Return:Stmt
    {
        public LogicNode value;
        public static Return Match()
        {
            var @return = new Return();
            Parser.Match(Tag.RETURN);
            @return.value = BoolTree.Match();
            Parser.Match(';');
            return @return;
        }
    }
}
