using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using UBHackingCompiler.Tokenize;
using  static UBHackingCompiler.Debug.Debugger;
using Type= UBHackingCompiler.Tokenize.Type;
namespace UBHackingCompiler.SyntacticAnalysis.Expression
{
    public class MathTree : LogicNode
    {
        private readonly LogicNode left;
        private readonly LogicNode right;

        public MathTree(Token op, LogicNode lhs, LogicNode rhs) : base(op, null)
        {
            left = lhs;
            right = rhs;
            type = null;
            //type = Type.Max(left.type, right.type);
            if (type == null) Error("TypeError");
        }

        public override string ToString() => left + " " + Op + " " + right;
        public static LogicNode Match() => MatchTemplate<MathTree>(Match_MD, new[] {'+', '-'});
        private static LogicNode Match_MD() => MatchTemplate<MathTree>(Unary.Match, new[] {'*', '/'});
    }
}
