using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MyLabrary;
using Random = MyLabrary.Random;

namespace UBHackingRenderer.Render.Mathematics
{
    public class OldMath
    {
        public static Vector3 RandomCosineDirection()
        {
            var r2 = Random.Get();
            var phi = 2 * Mathf.PI * Random.Get();
            return new Vector3(Mathf.Cos(phi) * 2 * Mathf.Sqrt(r2), Mathf.Sin(phi) * 2 * Mathf.Sqrt(r2), Mathf.Sqrt(1 - r2));
        }

        public static int Range(int v, int min, int max) => (v <= min) ? min :
            v >= max ? max : v;

        public static int Floor2Int(float f) => (int) Math.Floor(f);
    }
}
