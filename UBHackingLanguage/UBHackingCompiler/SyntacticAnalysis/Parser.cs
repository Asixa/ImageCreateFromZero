using System;
using UBHackingCompiler.Debug;
using UBHackingCompiler.SyntacticAnalysis.Definitions;
using UBHackingCompiler.Tokenize;
using static UBHackingCompiler.Debug.Debugger;

namespace UBHackingCompiler.SyntacticAnalysis
{
    public static class Parser
    {
        public static Token current;

        public static void Move() => current = Tokenizer.Scan();
        public static NameSpace code;

        public static void Start()
        {
            Move();
            code = NameSpace.Match();
        }

        public static void Match(int tag)
        {
            //Console.WriteLine(current.ToString());
            if (current.tag_value == tag) Move();
            else
            {
                string c = "";
                c = tag < 256 ? ((char) tag).ToString() : tag.ToString();
                Error("GrammarError" + ": " + current + " " + "Should Be" + " " + c);
            }
        }

        public static void Create()
        {
            code.Create();
            
        }

    }
}

