using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using UBHackingCompiler.Tokenize;
using Type = UBHackingCompiler.Tokenize.Type;
using static UBHackingCompiler.Debug.Debugger;
namespace UBHackingCompiler.SyntacticAnalysis.Expression
{
    public class BoolTree : LogicNode
    {
        public readonly LogicNode left;
        public readonly LogicNode right;

        public BoolTree(Token op, LogicNode lhs, LogicNode rhs) : base(op, null)
        {
            left = lhs;
            right = rhs;
            type = Check(lhs.type, rhs.type);
            if (type == null)Error("TypeError");
            
        }

        private Type Check(Type lft, Type rht)
        {
            switch (Op.tag_value)
            {
                case Tag.OR:
                case Tag.AND: return (lft == Type.Bool && rht == Type.Bool) ? Type.Bool : null;
                default: return lft == rht ? Type.Bool : null;
            }
        }

        public override string ToString() => left + " " + Op + " " + right;
        public static LogicNode Match() => MatchTemplate<BoolTree>(MatchSingleBool, new[] {Tag.OR, Tag.AND});
        private static LogicNode MatchSingleBool() => MatchTemplate<BoolTree>(MatchCompare, new[] {Tag.EQ, Tag.NE});

        private static LogicNode MatchCompare() =>
            MatchTemplate<BoolTree>(MathTree.Match, new[] {'<', '>', Tag.LE, Tag.GE}, false);
    }
}
