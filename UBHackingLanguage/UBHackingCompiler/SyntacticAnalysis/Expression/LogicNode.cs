
using System.Linq;
using UBHackingCompiler.SyntacticAnalysis.Definitions;
using UBHackingCompiler.Tokenize;
using Type = UBHackingCompiler.Tokenize.Type;

namespace UBHackingCompiler.SyntacticAnalysis.Expression
{
    public class LogicNode : Node
    {
        public Token Op { get; }
        public Type type { get; protected set; }

        protected LogicNode(Token tok, Type type)
        {
            Op = tok;
            this.type = type;
        }

        public virtual void Create()
        {
        }

        public override string ToString() => Op.ToString();

        protected delegate LogicNode Rule();

        protected static LogicNode MatchTemplate<T>
            (Rule rule, char[] operators, bool loop = true) where T : LogicNode
        {
            var expr = rule.Invoke();
            Rule single = () =>
            {
                var tok = Parser.current;
                Parser.Move();
                return typeof(T) == typeof(BoolTree)
                    ? new BoolTree(tok, expr, rule.Invoke()) as LogicNode
                    : new MathTree(tok, expr, rule.Invoke()) as LogicNode;
            };
            if (loop)
                while (operators.Contains(Parser.current.tag_value))
                    expr = single.Invoke();
            else if (operators.Contains(Parser.current.tag_value))
                return single.Invoke();
            return expr;
        }
    }
}
