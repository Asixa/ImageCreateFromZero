using static UBHackingCompiler.SyntacticAnalysis.Parser;
namespace UBHackingCompiler.SyntacticAnalysis.Definitions
{
    public class Block : Stmt
    {
        public new static Stmt Match()
        {
            Parser.Match('{');
            var stmt = Stmts.Match();
            Parser.Match('}');
            return stmt;
        }
    }
}
