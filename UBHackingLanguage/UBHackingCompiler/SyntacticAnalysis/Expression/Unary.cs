using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using UBHackingCompiler.Generator;
using UBHackingCompiler.Tokenize;
using  static UBHackingCompiler.Debug.Debugger;
using Type = UBHackingCompiler.Tokenize.Type;
namespace UBHackingCompiler.SyntacticAnalysis.Expression
{
    public class Unary : LogicNode
    {
        private LogicNode Expr { get; }

        private Unary(Token tok, LogicNode expr) : base(tok, Type.Max(Type.Int, expr.type))
        {
            if (type == null) Error("TypeError");
            Expr = expr;
        }

        public override string ToString() => Op + " " + Expr;

        public static LogicNode Match()
        {
            switch (Parser.current.tag_value)
            {
                case '-':
                    Parser.Move();
                    return new Unary(Word.Minus, Match());
                case '!':
                    Parser.Move();
                    return new Unary(Word.Not, Match());
                default:
                    return Factor.Match();
            }
        }

        public override void Create()
        {
            if (Op == Word.Minus)
            {
                Expr.Create();
                ILGen.AddInstruct(Instruction.neg);
            }
            else if(Op==Word.Not)
            {
                //TODO
            }
        }
    }
}
