using System;
using System.IO;
using UBHackingCompiler.Generator;
using UBHackingCompiler.SyntacticAnalysis;
using UBHackingCompiler.Tokenize;

namespace UBHackingCompiler
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.Title = "UBHackingCompiler";
            if (args.Length!=2)
            {
                Console.ForegroundColor = ConsoleColor.Yellow;
                Console.WriteLine(@"Please use '-dll [filename]' to compile");
                Console.ReadLine();
            }
            Tokenizer.Read(new StreamReader(args[1]));
            var filename = Path.GetFileNameWithoutExtension(args[1]);
            ILGen.moduleName = filename;
            var location = Path.GetFileNameWithoutExtension(args[1]);
            Parser.Start();
            ILGen.GenHeader();
            Parser.Create();
            Console.ForegroundColor = ConsoleColor.Cyan;
            Console.WriteLine(ILGen.ILCode);
            if(File.Exists(location + ".il"))File.Delete(location + ".il");
            if(File.Exists(location + ".dll"))File.Delete(location + ".dll");
            var sw = File.AppendText(location + ".il"); 
            sw.Write(ILGen.ILCode);
            sw.Flush();
            sw.Close();
            Console.ForegroundColor = ConsoleColor.Green;
        }
    }
}
