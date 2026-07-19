using System.Collections;
using System.Linq;
using TMPro;
using Unity.VisualScripting;
using UnityEngine;
using UnityEngine.InputSystem.LowLevel;
using UnityEngine.Serialization;
using UnityEngine.UI;

public class StoryBoard : MonoBehaviour
{
    public StateVariables game01;
    public TextMeshPro uiTextBox;
    public GameObject playerModel;
    public float textDelay = 0.1f;
    public float delayBetweenParas = 2f;
    [FormerlySerializedAs("rapierInventoryUI")] public GameObject broadswordInventoryUI;
    public DiceManager diceManager;
    public Text diceNumber;
    public Text DCText;
    
    private bool coroutineRunning = false;
    private int diceResult;
    private int DC;
    private bool diceSuccess = false;

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

        text = "Your attention goes towards a battered Broadsword. Point at it and press the grab button " +
               "to add it to inventory.";
        displayTextOnce(uiTextBox, text, false);
        yield return new WaitUntil(() => game01.swordPickedUp);
        game01.inventory.Add("Broadsword");
        broadswordInventoryUI.SetActive(true);

        text = "Press the 'X' button to look at your inventory.";
        displayTextOnce(uiTextBox, text, false);
        yield return new WaitUntil(() => game01.inventoryChecked);
        
        text = "Here you can see all the spells and weapons you have available. Press 'X' again to " +
               "close the inventory.";
        displayTextOnce(uiTextBox, text, false);
        yield return new WaitUntil(() => game01.inventoryClosed);

        text = "You feel like you should try to escape Elturel as soon as possible.";
        displayTextOnce(uiTextBox, text);
        yield return new WaitUntil(() => (coroutineRunning == false));

        text = "";
        uiTextBox.text = text;
        yield return new WaitUntil(() => game01.meetingRavenguard);
        
        text = "You spot Grand Duke Ulder Ravenguard amid the chaos of people running around.";
        displayTextOnce(uiTextBox, text);
        yield return new WaitUntil(() => (coroutineRunning == false));
        
        text = "Duke Ulder Ravenguard: You there! You look awfully calm for a situation like this. " +
               "Did you have something to do with all this?";
        displayTextOnce(uiTextBox, text);
        yield return new WaitUntil(() => (coroutineRunning == false));

        text = "X. What in the nine hells is happening here?\n" +
               "Y. I am just as confused as you, what do we do now?";
        game01.choiceAAvailable = true;
        //displayTextOnce(uiTextBox, text, false);
        uiTextBox.text = text;
        yield return new WaitUntil(() => (game01.choiceAAvailable == false));
        if (game01.choiceAX)
        {
            text = "Duke Ulder Ravenguard: Exactly right! It seems Elturel has been dragged into Avernus, " +
                   "the first layer of the Nine Hells. Thavius Kreeg has to be behind this! That must be why he " +
                   "invited me to Elturel at this time.";
            displayTextOnce(uiTextBox, text);
            yield return new WaitUntil(() => (coroutineRunning == false));
        }
        text = "Duke Ulder Ravenguard: I must do something to protect everyone from all the devils that lurk here";
        displayTextOnce(uiTextBox, text);
        yield return new WaitUntil(() => (coroutineRunning == false));

        text = "X. We should try to escape from Avernus!\n" +
               "Y. I would like to help you mobilize the people";
        game01.choiceBAvailable = true;
        //displayTextOnce(uiTextBox, text, false);
        uiTextBox.text = text;
        yield return new WaitUntil(() => (game01.choiceBAvailable == false));
        if (game01.choiceBX)
        {
            text = "Duke Ulder Ravenguard: No! I must help other people of this city! A mile south of here " +
                   "you'll find a wizard named Taxigor. He can Plane Shift you to Baldur's Gate.";
            displayTextOnce(uiTextBox, text);
            yield return new WaitUntil(() => (coroutineRunning == false));

            text = "X. [PERSUASION] You are a valuable resource to your people back in Baldur's Gate " +
                   "you shouldn't give up your life for the people in Elturel.\n" +
                   "Y. Very well, I shall leave. Thank you for your help.";
            game01.choiceCAvailable = true;
            //displayTextOnce(uiTextBox, text);
            uiTextBox.text = text;
            yield return new WaitUntil(() => (game01.choiceCAvailable == false));

            if (game01.choiceCX)
            {
                text = "Some dialogues require a skill check. Press the right trigger to roll the dice.";
                displayTextOnce(uiTextBox, text);
                yield return StartCoroutine(ResolveDiceRollRoutine(10, "Persuasion"));
                game01.diceTutorialDone = true;

                if (diceSuccess)
                {
                    text = "Duke Ulder Ravenguard: You are right! I shall accompany you to find Taxigor. " +
                           "Hope you can fight!";
                    displayTextOnce(uiTextBox, text);
                    yield return new WaitUntil(() => (coroutineRunning == false));
                }
                else
                {
                    text = "Duke Ulder Ravenguard: I appreciate your concern for my safety but I must do my " +
                           "duty to my people. Farewell!";
                    displayTextOnce(uiTextBox, text);
                    yield return new WaitUntil(() => (coroutineRunning == false));
                }
            }
        }
        else if (game01.choiceBY)
        {
            text = "Duke Ulder Ravenguard: No! It is too dangerous! A mile south of here " +
                   "you'll find a wizard named Taxigor. He can Plane Shift you to Baldur's Gate.";
            displayTextOnce(uiTextBox, text);
            yield return new WaitUntil(() => (coroutineRunning == false));
            
            text = "X. [INTIMIDATION] I can handle myself! Let me help, these are my people.\n" +
                   "Y. Very well, I shall leave. Thank you for your help.";
            game01.choiceDAvailable = true;
            //displayTextOnce(uiTextBox, text);
            uiTextBox.text = text;
            yield return new WaitUntil(() => (game01.choiceDAvailable == false));

            if (game01.choiceDX)
            {
                text = "Some dialogues require a skill check. Press the right trigger to roll the dice.";
                displayTextOnce(uiTextBox, text);
                yield return StartCoroutine(ResolveDiceRollRoutine(12, "Intimidation"));
                game01.diceTutorialDone = true;

                if (diceSuccess)
                {
                    text = "Duke Ulder Ravenguard: Good to see you have some courage in you! " +
                           "Lets rally more people and escort them to Taxigor.";
                    displayTextOnce(uiTextBox, text);
                    yield return new WaitUntil(() => (coroutineRunning == false));
                }
                else
                {
                    text = "Duke Ulder Ravenguard: Sorry to burst your bubble, but you are very puny " +
                           "I will not have your blood on my hands. Find Taxigor. Farewell!";
                    displayTextOnce(uiTextBox, text);
                    yield return new WaitUntil(() => (coroutineRunning == false));
                }
            }
        }

        text = "";
        displayTextOnce(uiTextBox, text, false);
    }

    IEnumerator ResolveDiceRollRoutine(int DC, string skill)
    {
        this.DC = DC;
        DCText.text = skill + ": DC " + this.DC.ToString();
        yield return StartCoroutine(RollDiceGetResultRoutine());
        if (diceResult == 20)
        {
            DCText.text = "Critical Success!";
            diceSuccess = true;
        }
        else if (diceResult == 1)
        {
            DCText.text = "Critical Failure!";
            diceSuccess = false;
        }
        else if (diceResult >= 10)
        {
            DCText.text = "Success";
            diceSuccess = true;
        }
        else if (diceResult < 10)
        {
            DCText.text = "Failure";
            diceSuccess = false;
        }
        game01.diceMenuCloseAvailable = true;
        yield return new WaitUntil(() => (game01.diceMenuCloseAvailable == false));
        diceNumber.text = "";
        DCText.text = "";
        diceManager.ResetDice();
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
