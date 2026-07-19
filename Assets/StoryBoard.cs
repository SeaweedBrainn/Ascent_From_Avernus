using System.Collections;
using System.Linq;
using TMPro;
using Unity.VisualScripting;
using UnityEngine;
using UnityEngine.InputSystem.LowLevel;
using UnityEngine.UI;

public class StoryBoard : MonoBehaviour
{
    public StateVariables game01;
    public TextMeshPro uiTextBox;
    public GameObject playerModel;
    public float textDelay = 0.1f;
    public float delayBetweenParas = 2f;
    public GameObject rapierInventoryUI;
    public DiceManager diceManager;
    public Text diceNumber;
    
    private bool coroutineRunning = false;
    private int diceResult;

    void Start()
    {
        game01.inventory.Add("Firebolt");
        game01.inventory.Add("Ray of Frost");
        game01.inventory.Add("Chill Touch");
        StartCoroutine(GameLoop());
    }

    IEnumerator GameLoop()
    {
        yield return new WaitUntil(() => game01.playPressed);
        
        string text = "You wake up in the holy city of Elturel. Just moments ago it rested proudly under the " +
                      "forever bright light of the Companion.";
        displayTextOnce(uiTextBox, text);
        yield return new WaitUntil(() => (coroutineRunning == false));
        
        text = "Now it lies half-burnt in a hellish place with devils crawling around. The Companion " +
               "lies extinguished, pulsating with a dark energy.";
        displayTextOnce(uiTextBox, text);
        yield return new WaitUntil(() => (coroutineRunning == false));
        
        text = "Use the left joystick to move.";
        displayTextOnce(uiTextBox, text, false);
        yield return new WaitUntil(() => game01.moveUsed);
        yield return new WaitForSecondsRealtime(delayBetweenParas);
        
        text = "Great! Now use the right joystick to turn left and right.";
        displayTextOnce(uiTextBox, text, false);
        yield return new WaitUntil(() => game01.rotateUsed);
        yield return new WaitForSecondsRealtime(delayBetweenParas);

        text = "You get the sense that you should probably look for a weapon to defend yourself.";
        displayTextOnce(uiTextBox, text);

        text = "";
        displayTextOnce(uiTextBox, text, false);
        yield return new WaitUntil(() => game01.swordFound);

        text = "Your attention goes towards a battered Rapier. Point at it and press the grab button " +
               "to add it to inventory.";
        displayTextOnce(uiTextBox, text, false);
        yield return new WaitUntil(() => game01.swordPickedUp);
        game01.inventory.Add("Rapier");
        rapierInventoryUI.SetActive(true);

        text = "Press the 'X' button to look at your inventory.";
        displayTextOnce(uiTextBox, text, false);
        yield return new WaitUntil(() => game01.inventoryChecked);
        
        text = "Here you can see all the spells and weapons you have available. Press 'X' again to " +
               "close the inventory.";
        displayTextOnce(uiTextBox, text, false);
        yield return new WaitUntil(() => game01.inventoryClosed);

        text = "You feel like you should try to escape Elturel as soon as possible.";
        displayTextOnce(uiTextBox, text);
        yield return new WaitUntil(() => game01.meetingRavenguard);
        
        text = "You spot Grand Duke Ulder Ravenguard amid the chaos of people running around.";
        displayTextOnce(uiTextBox, text);
        
        text = "Duke Ulder Ravenguard: You there! You look awfully calm for a situation like this. " +
               "Did you have something to do with all this?";
        displayTextOnce(uiTextBox, text);

        text = "X. What in the nine hells is happening here?\n" +
               "Y. I am just as confused as you, what do we do now?";
        game01.choiceAAvailable = true;
        displayTextOnce(uiTextBox, text, false);
        yield return new WaitUntil(() => (game01.choiceAAvailable == false));
        if (game01.choiceAX)
        {
            text = "Duke Ulder Ravenguard: Exactly right! It seems Elturel has been dragged into Avernus, " +
                   "the first layer of the Nine Hells. Thavius Kreeg has to be behind this! That must be why he " +
                   "invited me to Elturel at this time.";
            displayTextOnce(uiTextBox, text);
        }
    }

    IEnumerator RollDiceGetResultRoutine()
    {
        diceManager.AddDice();
        game01.diceAvailable = true;
        yield return new WaitUntil(() => (game01.diceAvailable == false));
        diceManager.RollDice();
        yield return new WaitUntil(() => (diceManager.isRolling == false));
        diceNumber.text = diceManager.result.ToString();
        diceNumber.gameObject.SetActive(true);
        diceResult = diceManager.result;
        game01.diceMenuCloseAvailable = true;
        yield return new WaitUntil(() => (game01.diceMenuCloseAvailable == false));
        diceNumber.text = "";
        diceManager.ResetDice();
    }
    
    private void displayTextOnce(TextMeshPro textMeshPro, string text, bool wait = true, bool lockView = false)
    {
        coroutineRunning = true;
        textMeshPro.text = text;
        textMeshPro.ForceMeshUpdate();
        textMeshPro.maxVisibleCharacters = 0;
        StartCoroutine(RevealText(textMeshPro, wait));
    }

    IEnumerator RevealText(TextMeshPro textMeshPro, bool wait)
    {
        for (int i = 0; i <= textMeshPro.text.Length; i++)
        {
            textMeshPro.maxVisibleCharacters = i;
            yield return new WaitForSeconds(textDelay);
        }
        if(wait) yield return new WaitForSecondsRealtime(delayBetweenParas);
        coroutineRunning = false;
    }
}
