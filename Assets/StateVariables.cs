using UnityEngine;
using UnityEngine.Serialization;

[CreateAssetMenu(fileName = "StateVariables", menuName = "Scriptable Objects/StateVariables")]
public class StateVariables : ScriptableObject
{
    [FormerlySerializedAs("PlayPressed")] public bool playPressed = false;
    public bool moveUsed = false;
    public bool rotateUsed = false;
    public bool swordFound = false;
    public bool swordPickedUp = false;
    public string[] inventory;
    public bool inventoryChecked = false;
    public bool inventoryClosed = false;
}
