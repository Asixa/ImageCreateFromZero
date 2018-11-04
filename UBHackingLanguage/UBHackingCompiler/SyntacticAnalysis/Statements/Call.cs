using System.Reflection.Emit;
using UBHackingCompiler.SyntacticAnalysis.Definitions;
using UBHackingCompiler.SyntacticAnalysis.Expression;

namespace UBHackingCompiler.SyntacticAnalysis.Statements
{
    class Call:Stmt
    {
        Identitifer funcName,returnType;
        public LogicNode value;
        public static Call Match(Identitifer name=null)
        {
            var call = new Call {funcName = name ?? Identitifer.Match()};
            Parser.Match('[');
            call.returnType=Identitifer.Match();
            Parser.Match(']');
            Parser.Match('(');
            call.value = BoolTree.Match();
            Parser.Match(')');
            Parser.Match(';');
            return call;
        }

        public override void Create()
        {
            base.Create();
        }
    }
}
