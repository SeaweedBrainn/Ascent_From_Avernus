using UnityEngine;

[CreateAssetMenu(fileName = "StateVariables", menuName = "Scriptable Objects/StateVariables")]
public class StateVariables : ScriptableObject
{
    public bool PlayPressed = false;
    public bool moveUsed = false;
    public bool rotateUsed = false;
    
}
