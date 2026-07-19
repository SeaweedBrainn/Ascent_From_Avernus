using UnityEngine;
using UnityEngine.InputSystem;
public class ButtonInputs : MonoBehaviour
{
    public StateVariables game01;
    public InputActionReference LeftTriggerPress;
    public InputActionReference RightTriggerPress;
    public InputActionReference LeftJoystick;
    public InputActionReference RightJoystick;
    public InputActionReference X_Button;

    public GameObject inventory;

    void Start()
    {
        LeftTriggerPress.action.started += PressPlay;
        
        RightTriggerPress.action.started += RollingDice;
        RightTriggerPress.action.started += CloseDiceMenu;
        
        LeftJoystick.action.started += UseMove;

        RightJoystick.action.started += UseRotate;

        X_Button.action.started += ToggleInventory;
    }

    void OnDestroy()
    {
        LeftTriggerPress.action.started -= PressPlay;
        
        RightTriggerPress.action.started -= RollingDice;
        RightTriggerPress.action.started -= CloseDiceMenu;
        
        LeftJoystick.action.started -= UseMove;

        RightJoystick.action.started -= UseRotate;

        X_Button.action.started -= ToggleInventory;
    }

    void PressPlay(InputAction.CallbackContext obj)
    {
        if (game01.playPressed == false)
        {
            game01.playPressed = true;
        }
    }

    void RollingDice(InputAction.CallbackContext obj)
    {
        if (game01.diceAvailable)
        {
            game01.diceAvailable = false;
        }
    }
    
    void CloseDiceMenu(InputAction.CallbackContext obj)
    {
        if (game01.diceMenuCloseAvailable)
        {
            game01.diceMenuCloseAvailable = false;
        }
    }
    
    void UseMove(InputAction.CallbackContext obj)
    {
        if (game01.playPressed == true) game01.moveUsed = true;
    }
    
    void UseRotate(InputAction.CallbackContext obj)
    {
        if (game01.moveUsed == true) game01.rotateUsed = true;
    }

    void ToggleInventory(InputAction.CallbackContext obj)
    {
        if (game01.diceAvailable == true)
        {
            inventory.SetActive(false);
            return;
        }
        if (inventory.activeInHierarchy == false)
        {
            if (game01.swordPickedUp == true) game01.inventoryChecked = true;
            inventory.SetActive(true);
        }
        else
        {
            if (game01.inventoryChecked == true) game01.inventoryClosed = true;
            inventory.SetActive(false);
        }
    }
}
