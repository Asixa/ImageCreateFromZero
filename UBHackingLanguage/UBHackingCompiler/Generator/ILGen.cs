
using System.Collections.Generic;
using UBHackingCompiler.SyntacticAnalysis.Definitions;

public enum Instruction
{
    ldarg_0,
    ret,
    neg,
    conv_r4,
    call,
    ldc_r4,
    conv_r8,

    ble_s,// <=
    bgt_s,// >
    blt_s,// <
    bge_s,// >=
    beq_s,
    bne_s,
    br_s,
    nop,
    stsfld,
    stfld,
}
namespace UBHackingCompiler.Generator
{
    public class ILGen
    {
        public static string moduleName = "";
        public static string ILCode;
        public static Func current_func;
        public static void AddLine(string line) => ILCode += line + "\n";
        public static void AddLeftBrace() => ILCode += "{" + "\n";
        public static void AddRightBrace() => ILCode += "}" + "\n";
        public static  int ILNumber;
        public static List<int>preserved=new List<int>();
        private static bool using_presered;
        private static int preseredid = -1;

        public static void AddInstruct(Instruction i, string v = "")
        {
            AddInstruct(i.ToString().Replace("_", "."),v);
        }

        public static string GetILNumber(int id) => "IL_" + id.ToString().PadLeft(4, '0');

        public static void UsePreserverd(int id)
        {
            using_presered = true;
            preseredid = id;
        }

        public static void AddPreserved(int id) => preserved.Add(id);
        public static void AddInstruct(string i, string v = "")
        {
            int GetNewID()
            {
                if (!preserved.Contains(ILNumber + 1)) return ++ILNumber;
                else
                {
                    ILNumber++;
                    return GetNewID();
                }
            }
            AddLine(GetILNumber(using_presered? preseredid : GetNewID()) + ": " + i.Replace("_", ".") + "     " + v);

            if (using_presered)
            {
                using_presered = false;
                preseredid = -1;
            }
        }
        #region HeaderInfo
        public struct assembly_extern_mscorlib
        {
            public string publickeytoken;
            public string ver;

            public assembly_extern_mscorlib(int a)
            {
                publickeytoken = "(B7 7A 5C 56 19 34 E0 89 )";
                ver = "4:0:0:0";
            }
        }
        public struct assembly_info
        {
            public string data;

            public assembly_info(int a)
            {
                data = @" .custom instance void [mscorlib]System.Runtime.CompilerServices.CompilationRelaxationsAttribute::.ctor(int32) = ( 01 00 08 00 00 00 00 00 ) 
  .custom instance void [mscorlib]System.Runtime.CompilerServices.RuntimeCompatibilityAttribute::.ctor() = ( 01 00 01 00 54 02 16 57 72 61 70 4E 6F 6E 45 78   // ....T..WrapNonEx
                                                                                                             63 65 70 74 69 6F 6E 54 68 72 6F 77 73 01 )       // ceptionThrows.

  //  .custom instance void [mscorlib]System.Diagnostics.DebuggableAttribute::.ctor(valuetype [mscorlib]System.Diagnostics.DebuggableAttribute/DebuggingModes) = ( 01 00 07 01 00 00 00 00 ) 

  .custom instance void [mscorlib]System.Reflection.AssemblyTitleAttribute::.ctor(string) = ( 01 00 0A 4D 79 4C 69 62 72 61 72 61 79 00 00 )    // ...MyLibraray..
  .custom instance void [mscorlib]System.Reflection.AssemblyDescriptionAttribute::.ctor(string) = ( 01 00 00 00 00 ) 
  .custom instance void [mscorlib]System.Reflection.AssemblyConfigurationAttribute::.ctor(string) = ( 01 00 00 00 00 ) 
  .custom instance void [mscorlib]System.Reflection.AssemblyCompanyAttribute::.ctor(string) = ( 01 00 00 00 00 ) 
  .custom instance void [mscorlib]System.Reflection.AssemblyProductAttribute::.ctor(string) = ( 01 00 0A 4D 79 4C 69 62 72 61 72 61 79 00 00 )    // ...MyLibraray..
  .custom instance void [mscorlib]System.Reflection.AssemblyCopyrightAttribute::.ctor(string) = ( 01 00 12 43 6F 70 79 72 69 67 68 74 20 C2 A9 20   // ...Copyright .. 
                                                                                                  20 32 30 31 38 00 00 )                            //  2018..
  .custom instance void [mscorlib]System.Reflection.AssemblyTrademarkAttribute::.ctor(string) = ( 01 00 00 00 00 ) 
  .custom instance void [mscorlib]System.Runtime.InteropServices.ComVisibleAttribute::.ctor(bool) = ( 01 00 00 00 00 ) 
  .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 37 61 32 30 32 39 62 34 2D 64 30 61 61   // ..$7a2029b4-d0aa
                                                                                                  2D 34 30 38 39 2D 39 61 32 30 2D 35 35 36 32 33   // -4089-9a20-55623
                                                                                                  64 33 61 64 35 61 63 00 00 )                      // d3ad5ac..
  .custom instance void [mscorlib]System.Reflection.AssemblyFileVersionAttribute::.ctor(string) = ( 01 00 07 31 2E 30 2E 30 2E 30 00 00 )             // ...1.0.0.0..
  .custom instance void [mscorlib]System.Runtime.Versioning.TargetFrameworkAttribute::.ctor(string) = ( 01 00 1C 2E 4E 45 54 46 72 61 6D 65 77 6F 72 6B   // ....NETFramework
                                                                                                        2C 56 65 72 73 69 6F 6E 3D 76 34 2E 36 2E 31 01   // ,Version=v4.6.1.
                                                                                                        00 54 0E 14 46 72 61 6D 65 77 6F 72 6B 44 69 73   // .T..FrameworkDis
                                                                                                        70 6C 61 79 4E 61 6D 65 14 2E 4E 45 54 20 46 72   // playName..NET Fr
                                                                                                        61 6D 65 77 6F 72 6B 20 34 2E 36 2E 31 )          // amework 4.6.1
  .hash algorithm 0x00008004
  .ver 1:0:0:0";
            }
        }
        public static string other_info = @"
.module MyLibraray.dll
.imagebase 0x10000000
.file alignment 0x00000200
.stackreserve 0x00100000
.subsystem 0x0003       // WINDOWS_CUI
.corflags 0x00000001    //  ILONLY";
        #endregion

        public static void GenHeader()
        {
            AddLine(".assembly extern mscorlib");
            AddLeftBrace();
            AddLine(".publickeytoken = "+ "(B7 7A 5C 56 19 34 E0 89) ");
            AddLine(".ver 4:0:0:0");
            AddRightBrace();


            AddLine(".assembly "+(moduleName==""?"MyUBHackingProgram":moduleName));
            AddLeftBrace();
            AddLine(new assembly_info(0).data);
            AddRightBrace();
            AddLine(other_info);
        }


    }
}
