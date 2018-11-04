using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection.Emit;
using System.Text;
using System.Threading.Tasks;
using UBHackingCompiler.Generator;
using UBHackingCompiler.SyntacticAnalysis.Definitions;
using UBHackingCompiler.SyntacticAnalysis.Expression;

namespace UBHackingCompiler.SyntacticAnalysis.Statements
{
    class OneLineFunction:Stmt
    {
        public LogicNode value;
        public static OneLineFunction Match()
        {
            return new OneLineFunction{value = BoolTree.Match()};
        }

        public override void Create()
        {
            //ILGen.AddInstruct(Instruction.ldarg_0);
            value.Create();
            ILGen.AddInstruct(Instruction.ret);
            
        }
    }
}
