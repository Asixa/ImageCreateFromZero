using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace UBHackingCompiler.Debug
{
    public static class Debugger
    {
        public static void Error(string msg) //向屏幕输出错误提示，并直接退出
        {
            Message(msg, ConsoleColor.Red);
           // if (Program.Debug) Console.ReadKey();
            //Environment.Exit(0);
        }

        public static void Message(string msg, ConsoleColor color) //向屏幕输出文字，可设置颜色
        {
            Console.ForegroundColor = color;
            Console.WriteLine(msg);
            Console.ForegroundColor = ConsoleColor.White;
        }
    }
}
