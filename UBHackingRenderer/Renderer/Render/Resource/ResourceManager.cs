using System.Collections.Generic;
using UBHackingRenderer.Render.Mathematics;
using MyLabrary;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;

namespace UBHackingRenderer.Render.Resource
{
    public static class ResourceManager
    {
        public static string ModelPath = "Resources/Model/";
        public static string TexturePath = "Resources/Textures/Demo/";
        public static string SkyboxPath = "Resources/Textures/Sky/";
        public static string ScenePath;

        public static float JsonToF(JToken t) => float.Parse(t.ToString());
        public static Vector3 JsonToV3(JToken t) =>Vector3.FromList(JsonConvert.DeserializeObject<List<float>>(t.ToString()));
    }

    public class CameraData
    {

    }


}
