using System.Collections.Generic;
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
    public List<string> inventory = new List<string>();
    public bool inventoryChecked = false;
    public bool inventoryClosed = false;
    public bool diceAvailable = false;
    public bool diceMenuCloseAvailable = false;

    public bool meetingRavenguard = false;
    
    public bool choiceAAvailable = false;
    public bool choiceAX = false;
    public bool choiceAY = false;
}
