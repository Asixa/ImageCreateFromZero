﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using UBHackingRenderer.Render.Mathematics;
using MyLabrary;
using UBHackingRenderer.Render.Components;
using UBHackingRenderer.Render.Materials;
using Random = MyLabrary.Random;

namespace UBHackingRenderer.Render.Primitives
{
    class PlaneXY:Hitable
    {
        private float x0, x1, y0, y1, k;
        private Shader shader;
        public override bool BoundingBox(float t0, float t1, ref AABB box)
        {
            box=new AABB(new Vector3(x0,y0,k-0.0001f),new Vector3(x1,y1,k+0.0001f) );
            return true;
        }

        public PlaneXY(float _x0, float _x1, float _y0, float _y1, float _k, Shader mat)
        {
            shader = mat;
            x0 = _x0;
            x1 = _x1;
            y0 = _y0;
            y1 = _y1;
            k = _k;
        }
        public override bool Hit(Ray ray, float t_min, float t_max, ref HitRecord rec)
        {
            var t = (k - ray.origin.z) / ray.direction.z;
            if (t < t_min || t > t_max) return false;
            var x = ray.origin.x + t * ray.direction.x;
            if (x < x0 || x > x1) return false;
            var y = ray.origin.y + t * ray.direction.y;
            if (y < y0 || y > y1) return false;

            rec.u = (x - x0) / (x1 - x0);
            rec.v = (y - y0) / (y1 - y0);
            rec.t = t;
            rec.shader = shader;
            rec.normal=new Vector3(0,0,1);
            rec.p = ray.GetPoint(t);
            return true;
        }
    }

    class PlaneXZ : Hitable
    {
        private float x0, x1, z0, z1, k;
        private Shader shader;

        public PlaneXZ(float _x0, float _x1, float _z0, float _z1, float _k, Shader mat)
        {
            shader = mat;
            x0 = _x0;
            x1 = _x1;
            z0 = _z0;
            z1 = _z1;
            k = _k;
        }

        public override float PdfValue(Vector3 o, Vector3 v)
        {
            var rec = new HitRecord();
            if (Hit(new Ray(o, v), 0.0001f, float.MaxValue, ref rec))
            {
                float area = (x1 - x0) * (z1 - z0);
                float ds = rec.t * rec.t * v.SqrtMagnitude;
                float cos = Mathf.Abs(Vector3.Dot(v, rec.normal) / v.length());
                return ds / (cos * area);
            }
            else return 0;
        }

        public override Vector3 Random(Vector3 o)
        {
            var randompoint=new Vector3(x0+MyLabrary.Random.Get()*(x1-x0),k,z0+MyLabrary.Random.Get()*(z1-z0));
            return randompoint - o;
        }

        public override bool BoundingBox(float t0, float t1, ref AABB box)
        {
            box = new AABB(new Vector3(x0, k - 0.0001f,z0), new Vector3(x1, k + 0.0001f,z1 ));
            return true;
        }
        public override bool Hit(Ray ray, float t_min, float t_max, ref HitRecord rec)
        {
            var t = (k - ray.origin.y) / ray.direction.y;
            if (t < t_min || t > t_max) return false;
            var x = ray.origin.x + t * ray.direction.x;
            if (x < x0 || x > x1) return false;
            var z = ray.origin.z + t * ray.direction.z;
            if (z < z0 || z > z1) return false;

            rec.u = (x - x0) / (x1 - x0);
            rec.v = (z - z0) / (z1 - z0);
            rec.t = t;
            rec.shader = shader;
            rec.normal = new Vector3(0, 1, 0);
            
            rec.p = ray.GetPoint(t);
            return true;
        }


    }

    class PlaneYZ : Hitable
    {
        private float z0, z1, y0, y1, k;
        private Shader shader;

        public PlaneYZ(float _y0, float _y1, float _z0, float _z1, float _k, Shader mat)
        {
            shader = mat;
            z0 = _z0;
            z1 = _z1;
            y0 = _y0;
            y1 = _y1;
            k = _k;
        }
        public override bool BoundingBox(float t0, float t1, ref AABB box)
        {
            box = new AABB(new Vector3(k - 0.0001f, y0, z0), new Vector3(k + 0.0001f, y1, z1));
            return true;
        }
        public override bool Hit(Ray ray, float t_min, float t_max, ref HitRecord rec)
        {
            var t = (k - ray.origin.x) / ray.direction.x;
            if (t < t_min || t > t_max) return false;
            var z = ray.origin.z + t * ray.direction.z;
            if (z < z0 || z > z1) return false;
            var y = ray.origin.y + t * ray.direction.y;
            if (y < y0 || y > y1) return false;
            rec.u = (y - y0) / (y1 - y0);
            rec.v = (z - z0) / (z1 - z0);
            rec.t = t;
            rec.shader = shader;
            rec.normal = new Vector3(1, 0, 0);
            rec.p = ray.GetPoint(t);
            return true;
        }
    }
}
