
//  Microsoft (R) .NET Framework IL Disassembler.  Version 4.6.81.0




// Metadata version: v4.0.30319
.assembly extern mscorlib
{
  .publickeytoken = (B7 7A 5C 56 19 34 E0 89 )                         // .z\V.4..
  .ver 4:0:0:0
}
.assembly MyLibraray
{
  .custom instance void [mscorlib]System.Runtime.CompilerServices.CompilationRelaxationsAttribute::.ctor(int32) = ( 01 00 08 00 00 00 00 00 ) 
  .custom instance void [mscorlib]System.Runtime.CompilerServices.RuntimeCompatibilityAttribute::.ctor() = ( 01 00 01 00 54 02 16 57 72 61 70 4E 6F 6E 45 78   // ....T..WrapNonEx
                                                                                                             63 65 70 74 69 6F 6E 54 68 72 6F 77 73 01 )       // ceptionThrows.

  // --- 下列自定义特性会自动添加，不要取消注释 -------
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
  .ver 1:0:0:0
}
.module MyLibraray.dll
// MVID: {80D5E21A-005A-4F04-B28A-B89B00E47489}
.imagebase 0x10000000
.file alignment 0x00000200
.stackreserve 0x00100000
.subsystem 0x0003       // WINDOWS_CUI
.corflags 0x00000001    //  ILONLY
// Image base: 0x07920000


// =============== CLASS MEMBERS DECLARATION ===================

.class public auto ansi beforefieldinit MyLabrary.Mathf
       extends [mscorlib]System.Object
{
  .field public static literal float32 PI = float32(3.1415927)
  .method public hidebysig static float32 
          Sqrt(float32 v) cil managed
  {
    // 代码大小       13 (0xd)
    .maxstack  8
    IL_0000:  ldarg.0
    IL_0001:  call       float64 [mscorlib]System.Convert::ToDouble(float32)
    IL_0006:  call       float64 [mscorlib]System.Math::Sqrt(float64)
    IL_000b:  conv.r4
    IL_000c:  ret
  } // end of method Mathf::Sqrt

  .method public hidebysig static float32 
          Range(float32 v,
                float32 min,
                float32 max) cil managed
  {
    // 代码大小       16 (0x10)
    .maxstack  8
    IL_0000:  ldarg.0
    IL_0001:  ldarg.1
    IL_0002:  ble.s      IL_000e

    IL_0004:  ldarg.0
    IL_0005:  ldarg.2
    IL_0006:  bge.s      IL_000b

    IL_0008:  ldarg.0
    IL_0009:  br.s       IL_000c

    IL_000b:  ldarg.2
    IL_000c:  br.s       IL_000f

    IL_000e:  ldarg.1
    IL_000f:  ret
  } // end of method Mathf::Range

  .method public hidebysig static int32  Range(int32 v,
                                               int32 min,
                                               int32 max) cil managed
  {
    // 代码大小       16 (0x10)
    .maxstack  8
    IL_0000:  ldarg.0
    IL_0001:  ldarg.1
    IL_0002:  ble.s      IL_000e

    IL_0004:  ldarg.0
    IL_0005:  ldarg.2
    IL_0006:  bge.s      IL_000b

    IL_0008:  ldarg.0
    IL_0009:  br.s       IL_000c

    IL_000b:  ldarg.2
    IL_000c:  br.s       IL_000f

    IL_000e:  ldarg.1
    IL_000f:  ret
  } // end of method Mathf::Range

  .method public hidebysig static float32 
          Tan(float32 f) cil managed
  {
    // 代码大小       9 (0x9)
    .maxstack  8
    IL_0000:  ldarg.0
    IL_0001:  conv.r8
    IL_0002:  call       float64 [mscorlib]System.Math::Tan(float64)
    IL_0007:  conv.r4
    IL_0008:  ret
  } // end of method Mathf::Tan

  .method public hidebysig static float32 
          Min(float32 a,
              float32 b) cil managed
  {
    // 代码大小       14 (0xe)
    .maxstack  2
    .locals init ([0] float32 V_0)
    IL_0000:  nop
    IL_0001:  ldarg.0
    IL_0002:  ldarg.1
    IL_0003:  blt.s      IL_0008

    IL_0005:  ldarg.1
    IL_0006:  br.s       IL_0009

    IL_0008:  ldarg.0
    IL_0009:  stloc.0
    IL_000a:  br.s       IL_000c

    IL_000c:  ldloc.0
    IL_000d:  ret
  } // end of method Mathf::Min

  .method public hidebysig static float32 
          Max(float32 a,
              float32 b) cil managed
  {
    // 代码大小       14 (0xe)
    .maxstack  2
    .locals init ([0] float32 V_0)
    IL_0000:  nop
    IL_0001:  ldarg.0
    IL_0002:  ldarg.1
    IL_0003:  bgt.s      IL_0008

    IL_0005:  ldarg.1
    IL_0006:  br.s       IL_0009

    IL_0008:  ldarg.0
    IL_0009:  stloc.0
    IL_000a:  br.s       IL_000c

    IL_000c:  ldloc.0
    IL_000d:  ret
  } // end of method Mathf::Max

  .method public hidebysig static float32 
          Lerp(float32 a,
               float32 b,
               float32 t) cil managed
  {
    // 代码大小       57 (0x39)
    .maxstack  3
    .locals init ([0] bool V_0,
             [1] float32 V_1,
             [2] bool V_2)
    IL_0000:  nop
    IL_0001:  ldarg.2
    IL_0002:  ldc.r4     0.0
    IL_0007:  cgt.un
    IL_0009:  ldc.i4.0
    IL_000a:  ceq
    IL_000c:  stloc.0
    IL_000d:  ldloc.0
    IL_000e:  brfalse.s  IL_0014

    IL_0010:  ldarg.0
    IL_0011:  stloc.1
    IL_0012:  br.s       IL_0037

    IL_0014:  ldarg.2
    IL_0015:  ldc.r4     1.
    IL_001a:  clt.un
    IL_001c:  ldc.i4.0
    IL_001d:  ceq
    IL_001f:  stloc.2
    IL_0020:  ldloc.2
    IL_0021:  brfalse.s  IL_0027

    IL_0023:  ldarg.1
    IL_0024:  stloc.1
    IL_0025:  br.s       IL_0037

    IL_0027:  ldarg.1
    IL_0028:  ldarg.2
    IL_0029:  mul
    IL_002a:  ldc.r4     1.
    IL_002f:  ldarg.2
    IL_0030:  sub
    IL_0031:  ldarg.0
    IL_0032:  mul
    IL_0033:  add
    IL_0034:  stloc.1
    IL_0035:  br.s       IL_0037

    IL_0037:  ldloc.1
    IL_0038:  ret
  } // end of method Mathf::Lerp

  .method public hidebysig static int32  Lerp(int32 a,
                                              int32 b,
                                              float32 t) cil managed
  {
    // 代码大小       66 (0x42)
    .maxstack  3
    .locals init ([0] bool V_0,
             [1] int32 V_1,
             [2] bool V_2)
    IL_0000:  nop
    IL_0001:  ldarg.2
    IL_0002:  ldc.r4     0.0
    IL_0007:  cgt.un
    IL_0009:  ldc.i4.0
    IL_000a:  ceq
    IL_000c:  stloc.0
    IL_000d:  ldloc.0
    IL_000e:  brfalse.s  IL_0014

    IL_0010:  ldarg.0
    IL_0011:  stloc.1
    IL_0012:  br.s       IL_0040

    IL_0014:  ldarg.2
    IL_0015:  ldc.r4     1.
    IL_001a:  clt.un
    IL_001c:  ldc.i4.0
    IL_001d:  ceq
    IL_001f:  stloc.2
    IL_0020:  ldloc.2
    IL_0021:  brfalse.s  IL_0027

    IL_0023:  ldarg.1
    IL_0024:  stloc.1
    IL_0025:  br.s       IL_0040

    IL_0027:  ldarg.1
    IL_0028:  conv.r4
    IL_0029:  ldarg.2
    IL_002a:  mul
    IL_002b:  ldc.r4     1.
    IL_0030:  ldarg.2
    IL_0031:  sub
    IL_0032:  ldarg.0
    IL_0033:  conv.r4
    IL_0034:  mul
    IL_0035:  add
    IL_0036:  ldc.r4     0.5
    IL_003b:  add
    IL_003c:  conv.i4
    IL_003d:  stloc.1
    IL_003e:  br.s       IL_0040

    IL_0040:  ldloc.1
    IL_0041:  ret
  } // end of method Mathf::Lerp

  .method public hidebysig static valuetype MyLabrary.Point 
          Lerp(valuetype MyLabrary.Point a,
               valuetype MyLabrary.Point b,
               float32 t) cil managed
  {
    // 代码大小       47 (0x2f)
    .maxstack  4
    .locals init ([0] valuetype MyLabrary.Point V_0)
    IL_0000:  nop
    IL_0001:  ldarg.0
    IL_0002:  ldfld      int32 MyLabrary.Point::x
    IL_0007:  ldarg.1
    IL_0008:  ldfld      int32 MyLabrary.Point::x
    IL_000d:  ldarg.2
    IL_000e:  call       int32 MyLabrary.Mathf::Lerp(int32,
                                                     int32,
                                                     float32)
    IL_0013:  ldarg.0
    IL_0014:  ldfld      int32 MyLabrary.Point::y
    IL_0019:  ldarg.1
    IL_001a:  ldfld      int32 MyLabrary.Point::y
    IL_001f:  ldarg.2
    IL_0020:  call       int32 MyLabrary.Mathf::Lerp(int32,
                                                     int32,
                                                     float32)
    IL_0025:  newobj     instance void MyLabrary.Point::.ctor(int32,
                                                              int32)
    IL_002a:  stloc.0
    IL_002b:  br.s       IL_002d

    IL_002d:  ldloc.0
    IL_002e:  ret
  } // end of method Mathf::Lerp

  .method public hidebysig static valuetype MyLabrary.Vector3 
          RandomCosineDirection() cil managed
  {
    // 代码大小       79 (0x4f)
    .maxstack  4
    .locals init ([0] float32 r2,
             [1] float32 phi,
             [2] valuetype MyLabrary.Vector3 V_2)
    IL_0000:  nop
    IL_0001:  call       float32 MyLabrary.Random::Get()
    IL_0006:  stloc.0
    IL_0007:  ldc.r4     6.2831855
    IL_000c:  call       float32 MyLabrary.Random::Get()
    IL_0011:  mul
    IL_0012:  stloc.1
    IL_0013:  ldloc.1
    IL_0014:  call       float32 MyLabrary.Mathf::Cos(float32)
    IL_0019:  ldc.r4     2.
    IL_001e:  mul
    IL_001f:  ldloc.0
    IL_0020:  call       float32 MyLabrary.Mathf::Sqrt(float32)
    IL_0025:  mul
    IL_0026:  ldloc.1
    IL_0027:  call       float32 MyLabrary.Mathf::Sin(float32)
    IL_002c:  ldc.r4     2.
    IL_0031:  mul
    IL_0032:  ldloc.0
    IL_0033:  call       float32 MyLabrary.Mathf::Sqrt(float32)
    IL_0038:  mul
    IL_0039:  ldc.r4     1.
    IL_003e:  ldloc.0
    IL_003f:  sub
    IL_0040:  call       float32 MyLabrary.Mathf::Sqrt(float32)
    IL_0045:  newobj     instance void MyLabrary.Vector3::.ctor(float32,
                                                                float32,
                                                                float32)
    IL_004a:  stloc.2
    IL_004b:  br.s       IL_004d

    IL_004d:  ldloc.2
    IL_004e:  ret
  } // end of method Mathf::RandomCosineDirection

  .method public hidebysig static void  Swap(float32& a,
                                             float32& b) cil managed
  {
    // 代码大小       12 (0xc)
    .maxstack  2
    .locals init ([0] float32 c)
    IL_0000:  nop
    IL_0001:  ldarg.0
    IL_0002:  ldind.r4
    IL_0003:  stloc.0
    IL_0004:  ldarg.0
    IL_0005:  ldarg.1
    IL_0006:  ldind.r4
    IL_0007:  stind.r4
    IL_0008:  ldarg.1
    IL_0009:  ldloc.0
    IL_000a:  stind.r4
    IL_000b:  ret
  } // end of method Mathf::Swap

  .method public hidebysig static float32 
          Pow(float32 f,
              float32 p) cil managed
  {
    // 代码大小       11 (0xb)
    .maxstack  8
    IL_0000:  ldarg.0
    IL_0001:  conv.r8
    IL_0002:  ldarg.1
    IL_0003:  conv.r8
    IL_0004:  call       float64 [mscorlib]System.Math::Pow(float64,
                                                            float64)
    IL_0009:  conv.r4
    IL_000a:  ret
  } // end of method Mathf::Pow

  .method public hidebysig static float32 
          Sin(float32 f) cil managed
  {
    // 代码大小       9 (0x9)
    .maxstack  8
    IL_0000:  ldarg.0
    IL_0001:  conv.r8
    IL_0002:  call       float64 [mscorlib]System.Math::Sin(float64)
    IL_0007:  conv.r4
    IL_0008:  ret
  } // end of method Mathf::Sin

  .method public hidebysig static float32 
          Cos(float32 f) cil managed
  {
    // 代码大小       9 (0x9)
    .maxstack  8
    IL_0000:  ldarg.0
    IL_0001:  conv.r8
    IL_0002:  call       float64 [mscorlib]System.Math::Cos(float64)
    IL_0007:  conv.r4
    IL_0008:  ret
  } // end of method Mathf::Cos

  .method public hidebysig static float32 
          Asin(float32 f) cil managed
  {
    // 代码大小       9 (0x9)
    .maxstack  8
    IL_0000:  ldarg.0
    IL_0001:  conv.r8
    IL_0002:  call       float64 [mscorlib]System.Math::Asin(float64)
    IL_0007:  conv.r4
    IL_0008:  ret
  } // end of method Mathf::Asin

  .method public hidebysig static float32 
          Floor(float32 f) cil managed
  {
    // 代码大小       9 (0x9)
    .maxstack  8
    IL_0000:  ldarg.0
    IL_0001:  conv.r8
    IL_0002:  call       float64 [mscorlib]System.Math::Floor(float64)
    IL_0007:  conv.r4
    IL_0008:  ret
  } // end of method Mathf::Floor

  .method public hidebysig static int32  Floor2Int(float32 f) cil managed
  {
    // 代码大小       9 (0x9)
    .maxstack  8
    IL_0000:  ldarg.0
    IL_0001:  conv.r8
    IL_0002:  call       float64 [mscorlib]System.Math::Floor(float64)
    IL_0007:  conv.i4
    IL_0008:  ret
  } // end of method Mathf::Floor2Int

  .method public hidebysig static float32 
          Abs(float32 f) cil managed
  {
    // 代码大小       7 (0x7)
    .maxstack  8
    IL_0000:  ldarg.0
    IL_0001:  call       float32 [mscorlib]System.Math::Abs(float32)
    IL_0006:  ret
  } // end of method Mathf::Abs

  .method public hidebysig static float32 
          Acos(float32 f) cil managed
  {
    // 代码大小       9 (0x9)
    .maxstack  8
    IL_0000:  ldarg.0
    IL_0001:  conv.r8
    IL_0002:  call       float64 [mscorlib]System.Math::Acos(float64)
    IL_0007:  conv.r4
    IL_0008:  ret
  } // end of method Mathf::Acos

  .method public hidebysig static float32 
          Atan(float32 f) cil managed
  {
    // 代码大小       9 (0x9)
    .maxstack  8
    IL_0000:  ldarg.0
    IL_0001:  conv.r8
    IL_0002:  call       float64 [mscorlib]System.Math::Atan(float64)
    IL_0007:  conv.r4
    IL_0008:  ret
  } // end of method Mathf::Atan

  .method public hidebysig static float32 
          Atan2(float32 y,
                float32 x) cil managed
  {
    // 代码大小       11 (0xb)
    .maxstack  8
    IL_0000:  ldarg.0
    IL_0001:  conv.r8
    IL_0002:  ldarg.1
    IL_0003:  conv.r8
    IL_0004:  call       float64 [mscorlib]System.Math::Atan2(float64,
                                                              float64)
    IL_0009:  conv.r4
    IL_000a:  ret
  } // end of method Mathf::Atan2

  .method public hidebysig static float32 
          Log(float32 f) cil managed
  {
    // 代码大小       9 (0x9)
    .maxstack  8
    IL_0000:  ldarg.0
    IL_0001:  conv.r8
    IL_0002:  call       float64 [mscorlib]System.Math::Log(float64)
    IL_0007:  conv.r4
    IL_0008:  ret
  } // end of method Mathf::Log

  .method public hidebysig static float32 
          DegreeToRadian(float32 angle) cil managed
  {
    // 代码大小       19 (0x13)
    .maxstack  2
    .locals init ([0] float32 V_0)
    IL_0000:  nop
    IL_0001:  ldc.r4     3.1415927
    IL_0006:  ldarg.0
    IL_0007:  mul
    IL_0008:  ldc.r4     180.
    IL_000d:  div
    IL_000e:  stloc.0
    IL_000f:  br.s       IL_0011

    IL_0011:  ldloc.0
    IL_0012:  ret
  } // end of method Mathf::DegreeToRadian

  .method public hidebysig static valuetype MyLabrary.Vector3 
          GetRelativePosition(valuetype MyLabrary.Vector3 t,
                              valuetype MyLabrary.Vector3 zR) cil managed
  {
    // 代码大小       229 (0xe5)
    .maxstack  3
    .locals init ([0] valuetype MyLabrary.Vector3 rot,
             [1] float32 x,
             [2] float32 y,
             [3] float32 z,
             [4] float32 y0,
             [5] float32 x0,
             [6] float32 z0,
             [7] float32 a,
             [8] valuetype MyLabrary.Vector3 V_8)
    IL_0000:  nop
    IL_0001:  ldarg.1
    IL_0002:  ldc.r4     57.29578
    IL_0007:  call       valuetype MyLabrary.Vector3 MyLabrary.Vector3::op_Division(valuetype MyLabrary.Vector3,
                                                                                    float32)
    IL_000c:  stloc.0
    IL_000d:  ldarga.s   t
    IL_000f:  call       instance float32 MyLabrary.Vector3::get_x()
    IL_0014:  stloc.1
    IL_0015:  ldarga.s   t
    IL_0017:  call       instance float32 MyLabrary.Vector3::get_y()
    IL_001c:  stloc.2
    IL_001d:  ldarga.s   t
    IL_001f:  call       instance float32 MyLabrary.Vector3::get_z()
    IL_0024:  stloc.3
    IL_0025:  ldloc.2
    IL_0026:  stloc.s    y0
    IL_0028:  ldloc.1
    IL_0029:  stloc.s    x0
    IL_002b:  ldloc.3
    IL_002c:  stloc.s    z0
    IL_002e:  ldloca.s   rot
    IL_0030:  call       instance float32 MyLabrary.Vector3::get_y()
    IL_0035:  stloc.s    a
    IL_0037:  ldloc.3
    IL_0038:  ldloc.s    a
    IL_003a:  call       float32 MyLabrary.Mathf::Cos(float32)
    IL_003f:  mul
    IL_0040:  ldloc.1
    IL_0041:  ldloc.s    a
    IL_0043:  call       float32 MyLabrary.Mathf::Sin(float32)
    IL_0048:  mul
    IL_0049:  sub
    IL_004a:  stloc.s    z0
    IL_004c:  ldloc.3
    IL_004d:  ldloc.s    a
    IL_004f:  call       float32 MyLabrary.Mathf::Sin(float32)
    IL_0054:  mul
    IL_0055:  ldloc.1
    IL_0056:  ldloc.s    a
    IL_0058:  call       float32 MyLabrary.Mathf::Cos(float32)
    IL_005d:  mul
    IL_005e:  add
    IL_005f:  stloc.s    x0
    IL_0061:  ldloc.s    y0
    IL_0063:  stloc.2
    IL_0064:  ldloc.s    z0
    IL_0066:  stloc.3
    IL_0067:  ldloca.s   rot
    IL_0069:  call       instance float32 MyLabrary.Vector3::get_x()
    IL_006e:  stloc.s    a
    IL_0070:  ldloc.2
    IL_0071:  ldloc.s    a
    IL_0073:  call       float32 MyLabrary.Mathf::Cos(float32)
    IL_0078:  mul
    IL_0079:  ldloc.3
    IL_007a:  ldloc.s    a
    IL_007c:  call       float32 MyLabrary.Mathf::Sin(float32)
    IL_0081:  mul
    IL_0082:  sub
    IL_0083:  stloc.s    y0
    IL_0085:  ldloc.2
    IL_0086:  ldloc.s    a
    IL_0088:  call       float32 MyLabrary.Mathf::Sin(float32)
    IL_008d:  mul
    IL_008e:  ldloc.3
    IL_008f:  ldloc.s    a
    IL_0091:  call       float32 MyLabrary.Mathf::Cos(float32)
    IL_0096:  mul
    IL_0097:  add
    IL_0098:  stloc.s    z0
    IL_009a:  ldloc.s    x0
    IL_009c:  stloc.1
    IL_009d:  ldloc.s    y0
    IL_009f:  stloc.2
    IL_00a0:  ldloca.s   rot
    IL_00a2:  call       instance float32 MyLabrary.Vector3::get_z()
    IL_00a7:  stloc.s    a
    IL_00a9:  ldloc.1
    IL_00aa:  ldloc.s    a
    IL_00ac:  call       float32 MyLabrary.Mathf::Cos(float32)
    IL_00b1:  mul
    IL_00b2:  ldloc.2
    IL_00b3:  ldloc.s    a
    IL_00b5:  call       float32 MyLabrary.Mathf::Sin(float32)
    IL_00ba:  mul
    IL_00bb:  sub
    IL_00bc:  stloc.s    x0
    IL_00be:  ldloc.1
    IL_00bf:  ldloc.s    a
    IL_00c1:  call       float32 MyLabrary.Mathf::Sin(float32)
    IL_00c6:  mul
    IL_00c7:  ldloc.2
    IL_00c8:  ldloc.s    a
    IL_00ca:  call       float32 MyLabrary.Mathf::Cos(float32)
    IL_00cf:  mul
    IL_00d0:  add
    IL_00d1:  stloc.s    y0
    IL_00d3:  ldloc.s    x0
    IL_00d5:  ldloc.s    y0
    IL_00d7:  ldloc.s    z0
    IL_00d9:  newobj     instance void MyLabrary.Vector3::.ctor(float32,
                                                                float32,
                                                                float32)
    IL_00de:  stloc.s    V_8
    IL_00e0:  br.s       IL_00e2

    IL_00e2:  ldloc.s    V_8
    IL_00e4:  ret
  } // end of method Mathf::GetRelativePosition

  .method public hidebysig specialname rtspecialname 
          instance void  .ctor() cil managed
  {
    // 代码大小       8 (0x8)
    .maxstack  8
    IL_0000:  ldarg.0
    IL_0001:  call       instance void [mscorlib]System.Object::.ctor()
    IL_0006:  nop
    IL_0007:  ret
  } // end of method Mathf::.ctor

} // end of class MyLabrary.Mathf

.class public sequential ansi sealed beforefieldinit MyLabrary.Point
       extends [mscorlib]System.ValueType
{
  .field public int32 x
  .field public int32 y
  .method public hidebysig specialname rtspecialname 
          instance void  .ctor(int32 a,
                               int32 b) cil managed
  {
    // 代码大小       16 (0x10)
    .maxstack  8
    IL_0000:  nop
    IL_0001:  ldarg.0
    IL_0002:  ldarg.1
    IL_0003:  stfld      int32 MyLabrary.Point::x
    IL_0008:  ldarg.0
    IL_0009:  ldarg.2
    IL_000a:  stfld      int32 MyLabrary.Point::y
    IL_000f:  ret
  } // end of method Point::.ctor

  .method public hidebysig virtual instance string 
          ToString() cil managed
  {
    // 代码大小       64 (0x40)
    .maxstack  4
    IL_0000:  ldc.i4.5
    IL_0001:  newarr     [mscorlib]System.Object
    IL_0006:  dup
    IL_0007:  ldc.i4.0
    IL_0008:  ldstr      "<"
    IL_000d:  stelem.ref
    IL_000e:  dup
    IL_000f:  ldc.i4.1
    IL_0010:  ldarg.0
    IL_0011:  ldfld      int32 MyLabrary.Point::x
    IL_0016:  box        [mscorlib]System.Int32
    IL_001b:  stelem.ref
    IL_001c:  dup
    IL_001d:  ldc.i4.2
    IL_001e:  ldstr      ","
    IL_0023:  stelem.ref
    IL_0024:  dup
    IL_0025:  ldc.i4.3
    IL_0026:  ldarg.0
    IL_0027:  ldfld      int32 MyLabrary.Point::y
    IL_002c:  box        [mscorlib]System.Int32
    IL_0031:  stelem.ref
    IL_0032:  dup
    IL_0033:  ldc.i4.4
    IL_0034:  ldstr      ">"
    IL_0039:  stelem.ref
    IL_003a:  call       string [mscorlib]System.String::Concat(object[])
    IL_003f:  ret
  } // end of method Point::ToString

  .method public hidebysig specialname static 
          valuetype MyLabrary.Point  op_Division(valuetype MyLabrary.Point a,
                                                 int32 b) cil managed
  {
    // 代码大小       22 (0x16)
    .maxstack  8
    IL_0000:  ldarg.0
    IL_0001:  ldfld      int32 MyLabrary.Point::x
    IL_0006:  ldarg.1
    IL_0007:  div
    IL_0008:  ldarg.0
    IL_0009:  ldfld      int32 MyLabrary.Point::y
    IL_000e:  ldarg.1
    IL_000f:  div
    IL_0010:  newobj     instance void MyLabrary.Point::.ctor(int32,
                                                              int32)
    IL_0015:  ret
  } // end of method Point::op_Division

  .method public hidebysig specialname static 
          valuetype MyLabrary.Point  op_Subtraction(valuetype MyLabrary.Point a,
                                                    valuetype MyLabrary.Point b) cil managed
  {
    // 代码大小       32 (0x20)
    .maxstack  8
    IL_0000:  ldarg.0
    IL_0001:  ldfld      int32 MyLabrary.Point::x
    IL_0006:  ldarg.1
    IL_0007:  ldfld      int32 MyLabrary.Point::x
    IL_000c:  sub
    IL_000d:  ldarg.0
    IL_000e:  ldfld      int32 MyLabrary.Point::y
    IL_0013:  ldarg.1
    IL_0014:  ldfld      int32 MyLabrary.Point::y
    IL_0019:  sub
    IL_001a:  newobj     instance void MyLabrary.Point::.ctor(int32,
                                                              int32)
    IL_001f:  ret
  } // end of method Point::op_Subtraction

  .method public hidebysig specialname static 
          valuetype MyLabrary.Point  op_Addition(valuetype MyLabrary.Point a,
                                                 valuetype MyLabrary.Point b) cil managed
  {
    // 代码大小       32 (0x20)
    .maxstack  8
    IL_0000:  ldarg.0
    IL_0001:  ldfld      int32 MyLabrary.Point::x
    IL_0006:  ldarg.1
    IL_0007:  ldfld      int32 MyLabrary.Point::x
    IL_000c:  add
    IL_000d:  ldarg.0
    IL_000e:  ldfld      int32 MyLabrary.Point::y
    IL_0013:  ldarg.1
    IL_0014:  ldfld      int32 MyLabrary.Point::y
    IL_0019:  add
    IL_001a:  newobj     instance void MyLabrary.Point::.ctor(int32,
                                                              int32)
    IL_001f:  ret
  } // end of method Point::op_Addition

  .method public hidebysig specialname instance float32 
          get_length() cil managed
  {
    // 代码大小       34 (0x22)
    .maxstack  8
    IL_0000:  ldarg.0
    IL_0001:  ldfld      int32 MyLabrary.Point::x
    IL_0006:  ldarg.0
    IL_0007:  ldfld      int32 MyLabrary.Point::x
    IL_000c:  mul
    IL_000d:  ldarg.0
    IL_000e:  ldfld      int32 MyLabrary.Point::y
    IL_0013:  ldarg.0
    IL_0014:  ldfld      int32 MyLabrary.Point::y
    IL_0019:  mul
    IL_001a:  add
    IL_001b:  conv.r4
    IL_001c:  call       float32 MyLabrary.Mathf::Sqrt(float32)
    IL_0021:  ret
  } // end of method Point::get_length

  .property instance float32 length()
  {
    .get instance float32 MyLabrary.Point::get_length()
  } // end of property Point::length
} // end of class MyLabrary.Point

.class public abstract auto ansi sealed beforefieldinit MyLabrary.Random
       extends [mscorlib]System.Object
{
  .field private static int64 seed
  .method public hidebysig static float32 
          Get() cil managed
  {
    // 代码大小       58 (0x3a)
    .maxstack  2
    .locals init ([0] float32 V_0)
    IL_0000:  nop
    IL_0001:  ldc.i8     0x5deece66d
    IL_000a:  ldsfld     int64 MyLabrary.Random::seed
    IL_000f:  mul
    IL_0010:  ldc.i4     0xb16
    IL_0015:  conv.i8
    IL_0016:  add
    IL_0017:  ldc.i8     0xffffffffffff
    IL_0020:  and
    IL_0021:  stsfld     int64 MyLabrary.Random::seed
    IL_0026:  ldsfld     int64 MyLabrary.Random::seed
    IL_002b:  ldc.i4.s   16
    IL_002d:  shr
    IL_002e:  conv.r4
    IL_002f:  ldc.r4     4.2949673e+009
    IL_0034:  div
    IL_0035:  stloc.0
    IL_0036:  br.s       IL_0038

    IL_0038:  ldloc.0
    IL_0039:  ret
  } // end of method Random::Get

  .method private hidebysig specialname rtspecialname static 
          void  .cctor() cil managed
  {
    // 代码大小       8 (0x8)
    .maxstack  8
    IL_0000:  ldc.i4.1
    IL_0001:  conv.i8
    IL_0002:  stsfld     int64 MyLabrary.Random::seed
    IL_0007:  ret
  } // end of method Random::.cctor

} // end of class MyLabrary.Random

.class public sequential ansi sealed beforefieldinit MyLabrary.Vector3
       extends [mscorlib]System.ValueType
{
  .custom instance void [mscorlib]System.Reflection.DefaultMemberAttribute::.ctor(string) = ( 01 00 04 49 74 65 6D 00 00 )                      // ...Item..
  .field private initonly float32[] data
  .field public static valuetype MyLabrary.Vector3 zero
  .field public static valuetype MyLabrary.Vector3 one
  .method public hidebysig specialname instance float32 
          get_x() cil managed
  {
    // 代码大小       9 (0x9)
    .maxstack  8
    IL_0000:  ldarg.0
    IL_0001:  ldfld      float32[] MyLabrary.Vector3::data
    IL_0006:  ldc.i4.0
    IL_0007:  ldelem.r4
    IL_0008:  ret
  } // end of method Vector3::get_x

  .method public hidebysig specialname instance void 
          set_x(float32 'value') cil managed
  {
    // 代码大小       10 (0xa)
    .maxstack  8
    IL_0000:  ldarg.0
    IL_0001:  ldfld      float32[] MyLabrary.Vector3::data
    IL_0006:  ldc.i4.0
    IL_0007:  ldarg.1
    IL_0008:  stelem.r4
    IL_0009:  ret
  } // end of method Vector3::set_x

  .method public hidebysig specialname instance float32 
          get_y() cil managed
  {
    // 代码大小       9 (0x9)
    .maxstack  8
    IL_0000:  ldarg.0
    IL_0001:  ldfld      float32[] MyLabrary.Vector3::data
    IL_0006:  ldc.i4.1
    IL_0007:  ldelem.r4
    IL_0008:  ret
  } // end of method Vector3::get_y

  .method public hidebysig specialname instance void 
          set_y(float32 'value') cil managed
  {
    // 代码大小       10 (0xa)
    .maxstack  8
    IL_0000:  ldarg.0
    IL_0001:  ldfld      float32[] MyLabrary.Vector3::data
    IL_0006:  ldc.i4.1
    IL_0007:  ldarg.1
    IL_0008:  stelem.r4
    IL_0009:  ret
  } // end of method Vector3::set_y

  .method public hidebysig specialname instance float32 
          get_z() cil managed
  {
    // 代码大小       9 (0x9)
    .maxstack  8
    IL_0000:  ldarg.0
    IL_0001:  ldfld      float32[] MyLabrary.Vector3::data
    IL_0006:  ldc.i4.2
    IL_0007:  ldelem.r4
    IL_0008:  ret
  } // end of method Vector3::get_z

  .method public hidebysig specialname instance void 
          set_z(float32 'value') cil managed
  {
    // 代码大小       10 (0xa)
    .maxstack  8
    IL_0000:  ldarg.0
    IL_0001:  ldfld      float32[] MyLabrary.Vector3::data
    IL_0006:  ldc.i4.2
    IL_0007:  ldarg.1
    IL_0008:  stelem.r4
    IL_0009:  ret
  } // end of method Vector3::set_z

  .method public hidebysig specialname instance float32 
          get_Item(int32 index) cil managed
  {
    // 代码大小       9 (0x9)
    .maxstack  8
    IL_0000:  ldarg.0
    IL_0001:  ldfld      float32[] MyLabrary.Vector3::data
    IL_0006:  ldarg.1
    IL_0007:  ldelem.r4
    IL_0008:  ret
  } // end of method Vector3::get_Item

  .method public hidebysig specialname instance void 
          set_Item(int32 index,
                   float32 'value') cil managed
  {
    // 代码大小       10 (0xa)
    .maxstack  8
    IL_0000:  ldarg.0
    IL_0001:  ldfld      float32[] MyLabrary.Vector3::data
    IL_0006:  ldarg.1
    IL_0007:  ldarg.2
    IL_0008:  stelem.r4
    IL_0009:  ret
  } // end of method Vector3::set_Item

  .method public hidebysig specialname rtspecialname 
          instance void  .ctor(float32 x,
                               float32 y,
                               float32 z) cil managed
  {
    // 代码大小       25 (0x19)
    .maxstack  8
    IL_0000:  ldarg.0
    IL_0001:  ldc.i4.3
    IL_0002:  newarr     [mscorlib]System.Single
    IL_0007:  dup
    IL_0008:  ldc.i4.0
    IL_0009:  ldarg.1
    IL_000a:  stelem.r4
    IL_000b:  dup
    IL_000c:  ldc.i4.1
    IL_000d:  ldarg.2
    IL_000e:  stelem.r4
    IL_000f:  dup
    IL_0010:  ldc.i4.2
    IL_0011:  ldarg.3
    IL_0012:  stelem.r4
    IL_0013:  stfld      float32[] MyLabrary.Vector3::data
    IL_0018:  ret
  } // end of method Vector3::.ctor

  .method public hidebysig specialname rtspecialname 
          instance void  .ctor(float32 a) cil managed
  {
    // 代码大小       25 (0x19)
    .maxstack  8
    IL_0000:  ldarg.0
    IL_0001:  ldc.i4.3
    IL_0002:  newarr     [mscorlib]System.Single
    IL_0007:  dup
    IL_0008:  ldc.i4.0
    IL_0009:  ldarg.1
    IL_000a:  stelem.r4
    IL_000b:  dup
    IL_000c:  ldc.i4.1
    IL_000d:  ldarg.1
    IL_000e:  stelem.r4
    IL_000f:  dup
    IL_0010:  ldc.i4.2
    IL_0011:  ldarg.1
    IL_0012:  stelem.r4
    IL_0013:  stfld      float32[] MyLabrary.Vector3::data
    IL_0018:  ret
  } // end of method Vector3::.ctor

  .method public hidebysig specialname rtspecialname 
          instance void  .ctor(valuetype MyLabrary.Vector3 copy) cil managed
  {
    // 代码大小       44 (0x2c)
    .maxstack  8
    IL_0000:  nop
    IL_0001:  ldarg.0
    IL_0002:  ldc.i4.3
    IL_0003:  newarr     [mscorlib]System.Single
    IL_0008:  dup
    IL_0009:  ldc.i4.0
    IL_000a:  ldarga.s   copy
    IL_000c:  call       instance float32 MyLabrary.Vector3::get_x()
    IL_0011:  stelem.r4
    IL_0012:  dup
    IL_0013:  ldc.i4.1
    IL_0014:  ldarga.s   copy
    IL_0016:  call       instance float32 MyLabrary.Vector3::get_y()
    IL_001b:  stelem.r4
    IL_001c:  dup
    IL_001d:  ldc.i4.2
    IL_001e:  ldarga.s   copy
    IL_0020:  call       instance float32 MyLabrary.Vector3::get_z()
    IL_0025:  stelem.r4
    IL_0026:  stfld      float32[] MyLabrary.Vector3::data
    IL_002b:  ret
  } // end of method Vector3::.ctor

  .method public hidebysig instance float32 
          length() cil managed
  {
    // 代码大小       47 (0x2f)
    .maxstack  8
    IL_0000:  ldarg.0
    IL_0001:  call       instance float32 MyLabrary.Vector3::get_x()
    IL_0006:  ldarg.0
    IL_0007:  call       instance float32 MyLabrary.Vector3::get_x()
    IL_000c:  mul
    IL_000d:  ldarg.0
    IL_000e:  call       instance float32 MyLabrary.Vector3::get_y()
    IL_0013:  ldarg.0
    IL_0014:  call       instance float32 MyLabrary.Vector3::get_y()
    IL_0019:  mul
    IL_001a:  add
    IL_001b:  ldarg.0
    IL_001c:  call       instance float32 MyLabrary.Vector3::get_z()
    IL_0021:  ldarg.0
    IL_0022:  call       instance float32 MyLabrary.Vector3::get_z()
    IL_0027:  mul
    IL_0028:  add
    IL_0029:  call       float32 MyLabrary.Mathf::Sqrt(float32)
    IL_002e:  ret
  } // end of method Vector3::length

  .method public hidebysig virtual instance string 
          ToString() cil managed
  {
    // 代码大小       91 (0x5b)
    .maxstack  4
    .locals init ([0] string V_0)
    IL_0000:  nop
    IL_0001:  ldc.i4.7
    IL_0002:  newarr     [mscorlib]System.Object
    IL_0007:  dup
    IL_0008:  ldc.i4.0
    IL_0009:  ldstr      "<"
    IL_000e:  stelem.ref
    IL_000f:  dup
    IL_0010:  ldc.i4.1
    IL_0011:  ldarg.0
    IL_0012:  call       instance float32 MyLabrary.Vector3::get_x()
    IL_0017:  box        [mscorlib]System.Single
    IL_001c:  stelem.ref
    IL_001d:  dup
    IL_001e:  ldc.i4.2
    IL_001f:  ldstr      ","
    IL_0024:  stelem.ref
    IL_0025:  dup
    IL_0026:  ldc.i4.3
    IL_0027:  ldarg.0
    IL_0028:  call       instance float32 MyLabrary.Vector3::get_y()
    IL_002d:  box        [mscorlib]System.Single
    IL_0032:  stelem.ref
    IL_0033:  dup
    IL_0034:  ldc.i4.4
    IL_0035:  ldstr      ","
    IL_003a:  stelem.ref
    IL_003b:  dup
    IL_003c:  ldc.i4.5
    IL_003d:  ldarg.0
    IL_003e:  call       instance float32 MyLabrary.Vector3::get_z()
    IL_0043:  box        [mscorlib]System.Single
    IL_0048:  stelem.ref
    IL_0049:  dup
    IL_004a:  ldc.i4.6
    IL_004b:  ldstr      ">"
    IL_0050:  stelem.ref
    IL_0051:  call       string [mscorlib]System.String::Concat(object[])
    IL_0056:  stloc.0
    IL_0057:  br.s       IL_0059

    IL_0059:  ldloc.0
    IL_005a:  ret
  } // end of method Vector3::ToString

  .method public hidebysig instance float32 
          Magnitude() cil managed
  {
    // 代码大小       47 (0x2f)
    .maxstack  8
    IL_0000:  ldarg.0
    IL_0001:  call       instance float32 MyLabrary.Vector3::get_x()
    IL_0006:  ldarg.0
    IL_0007:  call       instance float32 MyLabrary.Vector3::get_x()
    IL_000c:  mul
    IL_000d:  ldarg.0
    IL_000e:  call       instance float32 MyLabrary.Vector3::get_y()
    IL_0013:  ldarg.0
    IL_0014:  call       instance float32 MyLabrary.Vector3::get_y()
    IL_0019:  mul
    IL_001a:  add
    IL_001b:  ldarg.0
    IL_001c:  call       instance float32 MyLabrary.Vector3::get_z()
    IL_0021:  ldarg.0
    IL_0022:  call       instance float32 MyLabrary.Vector3::get_z()
    IL_0027:  mul
    IL_0028:  add
    IL_0029:  call       float32 MyLabrary.Mathf::Sqrt(float32)
    IL_002e:  ret
  } // end of method Vector3::Magnitude

  .method public hidebysig static valuetype MyLabrary.Vector3 
          FromList(class [mscorlib]System.Collections.Generic.List`1<float32> t) cil managed
  {
    // 代码大小       27 (0x1b)
    .maxstack  8
    IL_0000:  ldarg.0
    IL_0001:  ldc.i4.0
    IL_0002:  callvirt   instance !0 class [mscorlib]System.Collections.Generic.List`1<float32>::get_Item(int32)
    IL_0007:  ldarg.0
    IL_0008:  ldc.i4.1
    IL_0009:  callvirt   instance !0 class [mscorlib]System.Collections.Generic.List`1<float32>::get_Item(int32)
    IL_000e:  ldarg.0
    IL_000f:  ldc.i4.2
    IL_0010:  callvirt   instance !0 class [mscorlib]System.Collections.Generic.List`1<float32>::get_Item(int32)
    IL_0015:  newobj     instance void MyLabrary.Vector3::.ctor(float32,
                                                                float32,
                                                                float32)
    IL_001a:  ret
  } // end of method Vector3::FromList

  .method public hidebysig instance valuetype MyLabrary.Vector3 
          Normalized() cil managed
  {
    // 代码大小       64 (0x40)
    .maxstack  3
    .locals init ([0] float32 magnitude,
             [1] valuetype MyLabrary.Vector3 V_1)
    IL_0000:  nop
    IL_0001:  ldarg.0
    IL_0002:  call       instance float32 MyLabrary.Vector3::Magnitude()
    IL_0007:  stloc.0
    IL_0008:  ldarg.0
    IL_0009:  ldarg.0
    IL_000a:  call       instance float32 MyLabrary.Vector3::get_x()
    IL_000f:  ldloc.0
    IL_0010:  div
    IL_0011:  call       instance void MyLabrary.Vector3::set_x(float32)
    IL_0016:  nop
    IL_0017:  ldarg.0
    IL_0018:  ldarg.0
    IL_0019:  call       instance float32 MyLabrary.Vector3::get_y()
    IL_001e:  ldloc.0
    IL_001f:  div
    IL_0020:  call       instance void MyLabrary.Vector3::set_y(float32)
    IL_0025:  nop
    IL_0026:  ldarg.0
    IL_0027:  ldarg.0
    IL_0028:  call       instance float32 MyLabrary.Vector3::get_z()
    IL_002d:  ldloc.0
    IL_002e:  div
    IL_002f:  call       instance void MyLabrary.Vector3::set_z(float32)
    IL_0034:  nop
    IL_0035:  ldarg.0
    IL_0036:  ldobj      MyLabrary.Vector3
    IL_003b:  stloc.1
    IL_003c:  br.s       IL_003e

    IL_003e:  ldloc.1
    IL_003f:  ret
  } // end of method Vector3::Normalized

  .method public hidebysig static valuetype MyLabrary.Vector3 
          Normalize(valuetype MyLabrary.Vector3 v) cil managed
  {
    // 代码大小       46 (0x2e)
    .maxstack  4
    .locals init ([0] float32 magnitude,
             [1] valuetype MyLabrary.Vector3 V_1)
    IL_0000:  nop
    IL_0001:  ldarga.s   v
    IL_0003:  call       instance float32 MyLabrary.Vector3::Magnitude()
    IL_0008:  stloc.0
    IL_0009:  ldarga.s   v
    IL_000b:  call       instance float32 MyLabrary.Vector3::get_x()
    IL_0010:  ldloc.0
    IL_0011:  div
    IL_0012:  ldarga.s   v
    IL_0014:  call       instance float32 MyLabrary.Vector3::get_y()
    IL_0019:  ldloc.0
    IL_001a:  div
    IL_001b:  ldarga.s   v
    IL_001d:  call       instance float32 MyLabrary.Vector3::get_z()
    IL_0022:  ldloc.0
    IL_0023:  div
    IL_0024:  newobj     instance void MyLabrary.Vector3::.ctor(float32,
                                                                float32,
                                                                float32)
    IL_0029:  stloc.1
    IL_002a:  br.s       IL_002c

    IL_002c:  ldloc.1
    IL_002d:  ret
  } // end of method Vector3::Normalize

  .method public hidebysig static float32 
          Distance(valuetype MyLabrary.Vector3 a,
                   valuetype MyLabrary.Vector3 b) cil managed
  {
    // 代码大小       21 (0x15)
    .maxstack  2
    .locals init ([0] valuetype MyLabrary.Vector3 V_0,
             [1] float32 V_1)
    IL_0000:  nop
    IL_0001:  ldarg.0
    IL_0002:  ldarg.1
    IL_0003:  call       valuetype MyLabrary.Vector3 MyLabrary.Vector3::op_Subtraction(valuetype MyLabrary.Vector3,
                                                                                       valuetype MyLabrary.Vector3)
    IL_0008:  stloc.0
    IL_0009:  ldloca.s   V_0
    IL_000b:  call       instance float32 MyLabrary.Vector3::Magnitude()
    IL_0010:  stloc.1
    IL_0011:  br.s       IL_0013

    IL_0013:  ldloc.1
    IL_0014:  ret
  } // end of method Vector3::Distance

  .method public hidebysig specialname static 
          valuetype MyLabrary.Vector3  op_Addition(valuetype MyLabrary.Vector3 lhs,
                                                   valuetype MyLabrary.Vector3 rhs) cil managed
  {
    // 代码大小       51 (0x33)
    .maxstack  8
    IL_0000:  ldarga.s   lhs
    IL_0002:  call       instance float32 MyLabrary.Vector3::get_x()
    IL_0007:  ldarga.s   rhs
    IL_0009:  call       instance float32 MyLabrary.Vector3::get_x()
    IL_000e:  add
    IL_000f:  ldarga.s   lhs
    IL_0011:  call       instance float32 MyLabrary.Vector3::get_y()
    IL_0016:  ldarga.s   rhs
    IL_0018:  call       instance float32 MyLabrary.Vector3::get_y()
    IL_001d:  add
    IL_001e:  ldarga.s   lhs
    IL_0020:  call       instance float32 MyLabrary.Vector3::get_z()
    IL_0025:  ldarga.s   rhs
    IL_0027:  call       instance float32 MyLabrary.Vector3::get_z()
    IL_002c:  add
    IL_002d:  newobj     instance void MyLabrary.Vector3::.ctor(float32,
                                                                float32,
                                                                float32)
    IL_0032:  ret
  } // end of method Vector3::op_Addition

  .method public hidebysig specialname static 
          valuetype MyLabrary.Vector3  op_Multiply(valuetype MyLabrary.Vector3 lhs,
                                                   float32 v) cil managed
  {
    // 代码大小       33 (0x21)
    .maxstack  8
    IL_0000:  ldarga.s   lhs
    IL_0002:  call       instance float32 MyLabrary.Vector3::get_x()
    IL_0007:  ldarg.1
    IL_0008:  mul
    IL_0009:  ldarga.s   lhs
    IL_000b:  call       instance float32 MyLabrary.Vector3::get_y()
    IL_0010:  ldarg.1
    IL_0011:  mul
    IL_0012:  ldarga.s   lhs
    IL_0014:  call       instance float32 MyLabrary.Vector3::get_z()
    IL_0019:  ldarg.1
    IL_001a:  mul
    IL_001b:  newobj     instance void MyLabrary.Vector3::.ctor(float32,
                                                                float32,
                                                                float32)
    IL_0020:  ret
  } // end of method Vector3::op_Multiply

  .method public hidebysig specialname static 
          valuetype MyLabrary.Vector3  op_Multiply(float32 v,
                                                   valuetype MyLabrary.Vector3 rhs) cil managed
  {
    // 代码大小       33 (0x21)
    .maxstack  8
    IL_0000:  ldarga.s   rhs
    IL_0002:  call       instance float32 MyLabrary.Vector3::get_x()
    IL_0007:  ldarg.0
    IL_0008:  mul
    IL_0009:  ldarga.s   rhs
    IL_000b:  call       instance float32 MyLabrary.Vector3::get_y()
    IL_0010:  ldarg.0
    IL_0011:  mul
    IL_0012:  ldarga.s   rhs
    IL_0014:  call       instance float32 MyLabrary.Vector3::get_z()
    IL_0019:  ldarg.0
    IL_001a:  mul
    IL_001b:  newobj     instance void MyLabrary.Vector3::.ctor(float32,
                                                                float32,
                                                                float32)
    IL_0020:  ret
  } // end of method Vector3::op_Multiply

  .method public hidebysig specialname static 
          valuetype MyLabrary.Vector3  op_Division(valuetype MyLabrary.Vector3 lhs,
                                                   float32 v) cil managed
  {
    // 代码大小       33 (0x21)
    .maxstack  8
    IL_0000:  ldarga.s   lhs
    IL_0002:  call       instance float32 MyLabrary.Vector3::get_x()
    IL_0007:  ldarg.1
    IL_0008:  div
    IL_0009:  ldarga.s   lhs
    IL_000b:  call       instance float32 MyLabrary.Vector3::get_y()
    IL_0010:  ldarg.1
    IL_0011:  div
    IL_0012:  ldarga.s   lhs
    IL_0014:  call       instance float32 MyLabrary.Vector3::get_z()
    IL_0019:  ldarg.1
    IL_001a:  div
    IL_001b:  newobj     instance void MyLabrary.Vector3::.ctor(float32,
                                                                float32,
                                                                float32)
    IL_0020:  ret
  } // end of method Vector3::op_Division

  .method public hidebysig specialname static 
          valuetype MyLabrary.Vector3  op_Subtraction(valuetype MyLabrary.Vector3 lhs,
                                                      valuetype MyLabrary.Vector3 rhs) cil managed
  {
    // 代码大小       51 (0x33)
    .maxstack  8
    IL_0000:  ldarga.s   lhs
    IL_0002:  call       instance float32 MyLabrary.Vector3::get_x()
    IL_0007:  ldarga.s   rhs
    IL_0009:  call       instance float32 MyLabrary.Vector3::get_x()
    IL_000e:  sub
    IL_000f:  ldarga.s   lhs
    IL_0011:  call       instance float32 MyLabrary.Vector3::get_y()
    IL_0016:  ldarga.s   rhs
    IL_0018:  call       instance float32 MyLabrary.Vector3::get_y()
    IL_001d:  sub
    IL_001e:  ldarga.s   lhs
    IL_0020:  call       instance float32 MyLabrary.Vector3::get_z()
    IL_0025:  ldarga.s   rhs
    IL_0027:  call       instance float32 MyLabrary.Vector3::get_z()
    IL_002c:  sub
    IL_002d:  newobj     instance void MyLabrary.Vector3::.ctor(float32,
                                                                float32,
                                                                float32)
    IL_0032:  ret
  } // end of method Vector3::op_Subtraction

  .method public hidebysig specialname instance float32 
          get_SqrtMagnitude() cil managed
  {
    // 代码大小       42 (0x2a)
    .maxstack  8
    IL_0000:  ldarg.0
    IL_0001:  call       instance float32 MyLabrary.Vector3::get_x()
    IL_0006:  ldarg.0
    IL_0007:  call       instance float32 MyLabrary.Vector3::get_x()
    IL_000c:  mul
    IL_000d:  ldarg.0
    IL_000e:  call       instance float32 MyLabrary.Vector3::get_y()
    IL_0013:  ldarg.0
    IL_0014:  call       instance float32 MyLabrary.Vector3::get_y()
    IL_0019:  mul
    IL_001a:  add
    IL_001b:  ldarg.0
    IL_001c:  call       instance float32 MyLabrary.Vector3::get_z()
    IL_0021:  ldarg.0
    IL_0022:  call       instance float32 MyLabrary.Vector3::get_z()
    IL_0027:  mul
    IL_0028:  add
    IL_0029:  ret
  } // end of method Vector3::get_SqrtMagnitude

  .method public hidebysig specialname static 
          valuetype MyLabrary.Vector3  op_UnaryNegation(valuetype MyLabrary.Vector3 a) cil managed
  {
    // 代码大小       30 (0x1e)
    .maxstack  8
    IL_0000:  ldarga.s   a
    IL_0002:  call       instance float32 MyLabrary.Vector3::get_x()
    IL_0007:  neg
    IL_0008:  ldarga.s   a
    IL_000a:  call       instance float32 MyLabrary.Vector3::get_y()
    IL_000f:  neg
    IL_0010:  ldarga.s   a
    IL_0012:  call       instance float32 MyLabrary.Vector3::get_z()
    IL_0017:  neg
    IL_0018:  newobj     instance void MyLabrary.Vector3::.ctor(float32,
                                                                float32,
                                                                float32)
    IL_001d:  ret
  } // end of method Vector3::op_UnaryNegation

  .method public hidebysig specialname static 
          valuetype MyLabrary.Vector3  op_Multiply(valuetype MyLabrary.Vector3 lhs,
                                                   valuetype MyLabrary.Vector3 rhs) cil managed
  {
    // 代码大小       51 (0x33)
    .maxstack  8
    IL_0000:  ldarga.s   lhs
    IL_0002:  call       instance float32 MyLabrary.Vector3::get_x()
    IL_0007:  ldarga.s   rhs
    IL_0009:  call       instance float32 MyLabrary.Vector3::get_x()
    IL_000e:  mul
    IL_000f:  ldarga.s   lhs
    IL_0011:  call       instance float32 MyLabrary.Vector3::get_y()
    IL_0016:  ldarga.s   rhs
    IL_0018:  call       instance float32 MyLabrary.Vector3::get_y()
    IL_001d:  mul
    IL_001e:  ldarga.s   lhs
    IL_0020:  call       instance float32 MyLabrary.Vector3::get_z()
    IL_0025:  ldarga.s   rhs
    IL_0027:  call       instance float32 MyLabrary.Vector3::get_z()
    IL_002c:  mul
    IL_002d:  newobj     instance void MyLabrary.Vector3::.ctor(float32,
                                                                float32,
                                                                float32)
    IL_0032:  ret
  } // end of method Vector3::op_Multiply

  .method public hidebysig specialname static 
          bool  op_Equality(valuetype MyLabrary.Vector3 lhs,
                            valuetype MyLabrary.Vector3 rhs) cil managed
  {
    // 代码大小       20 (0x14)
    .maxstack  8
    IL_0000:  ldarg.0
    IL_0001:  ldarg.1
    IL_0002:  call       valuetype MyLabrary.Vector3 MyLabrary.Vector3::op_Subtraction(valuetype MyLabrary.Vector3,
                                                                                       valuetype MyLabrary.Vector3)
    IL_0007:  call       float32 MyLabrary.Vector3::SqrMagnitude(valuetype MyLabrary.Vector3)
    IL_000c:  ldc.r4     9.9999994e-011
    IL_0011:  clt
    IL_0013:  ret
  } // end of method Vector3::op_Equality

  .method public hidebysig specialname static 
          bool  op_Inequality(valuetype MyLabrary.Vector3 lhs,
                              valuetype MyLabrary.Vector3 rhs) cil managed
  {
    // 代码大小       11 (0xb)
    .maxstack  8
    IL_0000:  ldarg.0
    IL_0001:  ldarg.1
    IL_0002:  call       bool MyLabrary.Vector3::op_Equality(valuetype MyLabrary.Vector3,
                                                             valuetype MyLabrary.Vector3)
    IL_0007:  ldc.i4.0
    IL_0008:  ceq
    IL_000a:  ret
  } // end of method Vector3::op_Inequality

  .method public hidebysig static float32 
          SqrMagnitude(valuetype MyLabrary.Vector3 'vector') cil managed
  {
    // 代码大小       48 (0x30)
    .maxstack  8
    IL_0000:  ldarga.s   'vector'
    IL_0002:  call       instance float32 MyLabrary.Vector3::get_x()
    IL_0007:  ldarga.s   'vector'
    IL_0009:  call       instance float32 MyLabrary.Vector3::get_x()
    IL_000e:  mul
    IL_000f:  ldarga.s   'vector'
    IL_0011:  call       instance float32 MyLabrary.Vector3::get_y()
    IL_0016:  ldarga.s   'vector'
    IL_0018:  call       instance float32 MyLabrary.Vector3::get_y()
    IL_001d:  mul
    IL_001e:  add
    IL_001f:  ldarga.s   'vector'
    IL_0021:  call       instance float32 MyLabrary.Vector3::get_z()
    IL_0026:  ldarga.s   'vector'
    IL_0028:  call       instance float32 MyLabrary.Vector3::get_z()
    IL_002d:  mul
    IL_002e:  add
    IL_002f:  ret
  } // end of method Vector3::SqrMagnitude

  .method public hidebysig static float32 
          Dot(valuetype MyLabrary.Vector3 lhs,
              valuetype MyLabrary.Vector3 rhs) cil managed
  {
    // 代码大小       48 (0x30)
    .maxstack  8
    IL_0000:  ldarga.s   lhs
    IL_0002:  call       instance float32 MyLabrary.Vector3::get_x()
    IL_0007:  ldarga.s   rhs
    IL_0009:  call       instance float32 MyLabrary.Vector3::get_x()
    IL_000e:  mul
    IL_000f:  ldarga.s   lhs
    IL_0011:  call       instance float32 MyLabrary.Vector3::get_y()
    IL_0016:  ldarga.s   rhs
    IL_0018:  call       instance float32 MyLabrary.Vector3::get_y()
    IL_001d:  mul
    IL_001e:  add
    IL_001f:  ldarga.s   lhs
    IL_0021:  call       instance float32 MyLabrary.Vector3::get_z()
    IL_0026:  ldarga.s   rhs
    IL_0028:  call       instance float32 MyLabrary.Vector3::get_z()
    IL_002d:  mul
    IL_002e:  add
    IL_002f:  ret
  } // end of method Vector3::Dot

  .method public hidebysig static valuetype MyLabrary.Vector3 
          Cross(valuetype MyLabrary.Vector3 lhs,
                valuetype MyLabrary.Vector3 rhs) cil managed
  {
    // 代码大小       99 (0x63)
    .maxstack  5
    IL_0000:  ldarga.s   lhs
    IL_0002:  call       instance float32 MyLabrary.Vector3::get_y()
    IL_0007:  ldarga.s   rhs
    IL_0009:  call       instance float32 MyLabrary.Vector3::get_z()
    IL_000e:  mul
    IL_000f:  ldarga.s   lhs
    IL_0011:  call       instance float32 MyLabrary.Vector3::get_z()
    IL_0016:  ldarga.s   rhs
    IL_0018:  call       instance float32 MyLabrary.Vector3::get_y()
    IL_001d:  mul
    IL_001e:  sub
    IL_001f:  ldarga.s   lhs
    IL_0021:  call       instance float32 MyLabrary.Vector3::get_z()
    IL_0026:  ldarga.s   rhs
    IL_0028:  call       instance float32 MyLabrary.Vector3::get_x()
    IL_002d:  mul
    IL_002e:  ldarga.s   lhs
    IL_0030:  call       instance float32 MyLabrary.Vector3::get_x()
    IL_0035:  ldarga.s   rhs
    IL_0037:  call       instance float32 MyLabrary.Vector3::get_z()
    IL_003c:  mul
    IL_003d:  sub
    IL_003e:  ldarga.s   lhs
    IL_0040:  call       instance float32 MyLabrary.Vector3::get_x()
    IL_0045:  ldarga.s   rhs
    IL_0047:  call       instance float32 MyLabrary.Vector3::get_y()
    IL_004c:  mul
    IL_004d:  ldarga.s   lhs
    IL_004f:  call       instance float32 MyLabrary.Vector3::get_y()
    IL_0054:  ldarga.s   rhs
    IL_0056:  call       instance float32 MyLabrary.Vector3::get_x()
    IL_005b:  mul
    IL_005c:  sub
    IL_005d:  newobj     instance void MyLabrary.Vector3::.ctor(float32,
                                                                float32,
                                                                float32)
    IL_0062:  ret
  } // end of method Vector3::Cross

  .method private hidebysig specialname rtspecialname static 
          void  .cctor() cil managed
  {
    // 代码大小       51 (0x33)
    .maxstack  8
    IL_0000:  ldc.r4     0.0
    IL_0005:  ldc.r4     0.0
    IL_000a:  ldc.r4     0.0
    IL_000f:  newobj     instance void MyLabrary.Vector3::.ctor(float32,
                                                                float32,
                                                                float32)
    IL_0014:  stsfld     valuetype MyLabrary.Vector3 MyLabrary.Vector3::zero
    IL_0019:  ldc.r4     1.
    IL_001e:  ldc.r4     1.
    IL_0023:  ldc.r4     1.
    IL_0028:  newobj     instance void MyLabrary.Vector3::.ctor(float32,
                                                                float32,
                                                                float32)
    IL_002d:  stsfld     valuetype MyLabrary.Vector3 MyLabrary.Vector3::one
    IL_0032:  ret
  } // end of method Vector3::.cctor

  .property instance float32 x()
  {
    .get instance float32 MyLabrary.Vector3::get_x()
    .set instance void MyLabrary.Vector3::set_x(float32)
  } // end of property Vector3::x
  .property instance float32 y()
  {
    .get instance float32 MyLabrary.Vector3::get_y()
    .set instance void MyLabrary.Vector3::set_y(float32)
  } // end of property Vector3::y
  .property instance float32 z()
  {
    .get instance float32 MyLabrary.Vector3::get_z()
    .set instance void MyLabrary.Vector3::set_z(float32)
  } // end of property Vector3::z
  .property instance float32 Item(int32)
  {
    .get instance float32 MyLabrary.Vector3::get_Item(int32)
    .set instance void MyLabrary.Vector3::set_Item(int32,
                                                   float32)
  } // end of property Vector3::Item
  .property instance float32 SqrtMagnitude()
  {
    .get instance float32 MyLabrary.Vector3::get_SqrtMagnitude()
  } // end of property Vector3::SqrtMagnitude
} // end of class MyLabrary.Vector3


// =============================================================

// *********** 反汇编完成 ***********************
// 警告: 创建了 Win32 资源文件 F:\ALight-master\MyLibraray\bin\Debug\MyLibrary.res
