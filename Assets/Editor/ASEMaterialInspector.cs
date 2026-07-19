using UnityEditor;
using UnityEngine;

public class ASEMaterialInspector : ShaderGUI
{
    public override void OnGUI(MaterialEditor materialEditor, MaterialProperty[] properties)
    {
        EditorGUI.BeginChangeCheck();
        materialEditor.PropertiesDefaultGUI(properties);
        EditorGUI.EndChangeCheck();
    }
}
