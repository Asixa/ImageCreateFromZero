using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using UBHackingCompiler.SyntacticAnalysis.Definitions;
using UBHackingCompiler.SyntacticAnalysis.Expression;

namespace UBHackingCompiler.SyntacticAnalysis.Statements
{
    public class BitAnd:Stmt
    {
        public LogicNode v1, v2;
        public static BitAnd Match()
        {
            var bitand=new BitAnd();
            Parser.Match('$');
            bitand.v1 = BoolTree.Match();
            Parser.Match(',');
            bitand.v2 = BoolTree.Match();
            Parser.Match(';');
            return bitand;
        }
    }
}
