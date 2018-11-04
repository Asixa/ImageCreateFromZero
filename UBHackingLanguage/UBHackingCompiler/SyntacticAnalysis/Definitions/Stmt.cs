using static UBHackingCompiler.SyntacticAnalysis.Parser;
using System.Reflection.Emit;
using UBHackingCompiler.SyntacticAnalysis.Statements;

namespace UBHackingCompiler.SyntacticAnalysis.Definitions
{
    public class Stmt : Node
    {
        protected static readonly Stmt Null = new Stmt();
        public static Stmt Enclosing = Null;
        public virtual void Create() { }

        protected static Stmt Match()
        {
            switch (current.tag_value)
            {
                case ';':
                    Move();
                    return Null;
                case '{':
                    return Block.Match();
                case Tag.LET:
                    return Assign.Match();
                case Tag.RETURN:
                    return Return.Match();
                case '$':
                    return BitAnd.Match(); 
                    //                case DEF:
                    //                    return Variable.Defination();
                    //                default:
                    //                    return FuncCall.Match();

            }

            return null;
        }
    }

    public class Stmts : Stmt
    {
        private readonly Stmt stmt1, stmt2;

        private Stmts(Stmt s1, Stmt s2)
        {
            stmt1 = s1;
            stmt2 = s2;
        }
        public new static Stmt Match() => current.tag_value == '}' ? Null : new Stmts(Stmt.Match(), Match());

        public override void Create()
        {
            stmt1.Create();
            stmt2.Create();
        }
    }
}
