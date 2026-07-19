using UnityEngine;
using UnityEngine.InputSystem;
public class ButtonInputs : MonoBehaviour
{
    public StateVariables game01;
    public InputActionReference LeftTriggerPress;
    public InputActionReference LeftJoystick;
    public InputActionReference RightJoystick;

    void Start()
    {
        LeftTriggerPress.action.started += PressPlay;
        
        LeftJoystick.action.started += UseMove;

        RightJoystick.action.started += UseRotate;
    }

    void OnDestroy()
    {
        LeftTriggerPress.action.started -= PressPlay;
    }

    void PressPlay(InputAction.CallbackContext obj)
    {
        if (game01.PlayPressed == false)
        {
            game01.PlayPressed = true;
        }
    }

    void UseMove(InputAction.CallbackContext obj)
    {
        if (game01.PlayPressed == true) game01.moveUsed = true;
    }
    
    void UseRotate(InputAction.CallbackContext obj)
    {
        if (game01.moveUsed == true) game01.rotateUsed = true;
    }
}
