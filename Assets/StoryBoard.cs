using System.Collections;
using System.Linq;
using TMPro;
using UnityEngine;
using UnityEngine.UI;

public class StoryBoard : MonoBehaviour
{
    public StateVariables game01;
    public TextMeshPro uiTextBox;
    public GameObject playerModel;
    public float textDelay = 0.1f;
    public float delayBetweenParas = 2f;
    public GameObject rapierInventoryUI;
    
    private bool coroutineRunning = false;

    void Start()
    {
        game01.inventory.Append("Firebolt");
        game01.inventory.Append("Ray of Frost");
        game01.inventory.Append("Chill Touch");
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

        text = "Look around! Find a way to defend yourself!";
        displayTextOnce(uiTextBox, text);

        text = "";
        displayTextOnce(uiTextBox, text, false);
        yield return new WaitUntil(() => game01.swordFound);

        text = "Look a rapier! Point at it and press the grab button to add it to inventory.";
        displayTextOnce(uiTextBox, text, false);
        yield return new WaitUntil(() => game01.swordPickedUp);
        game01.inventory.Append("Rapier");
        rapierInventoryUI.SetActive(true);

        text = "Press the 'X' button to look at your inventory.";
        displayTextOnce(uiTextBox, text, false);
        yield return new WaitUntil(() => game01.inventoryChecked);
        
        text = "Here you can see all the spells and weapons you have available. Press 'X' again to " +
               "close the inventory.";
        displayTextOnce(uiTextBox, text, false);
        yield return new WaitUntil(() => game01.inventoryClosed);

        text = "passed";
        displayTextOnce(uiTextBox, text);
    }

    private void displayTextOnce(TextMeshPro textMeshPro, string text, bool wait = true)
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
