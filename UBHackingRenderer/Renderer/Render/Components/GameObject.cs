﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using UBHackingRenderer.Render.Materials;

namespace UBHackingRenderer.Render.Components
{
    public class GameObject
    {
        public List<GameObject> all=new List<GameObject>();
        public List<Component> components=new List<Component>();
        public GameObject()=> all.Add(this);
        public Transform transform;
        public Shader shader;
    }
}
