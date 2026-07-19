using System.Collections;
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
    
    private bool coroutineRunning = false;

    void Start()
    {
        StartCoroutine(GameLoop());
    }

    IEnumerator GameLoop()
    {
        yield return new WaitUntil(() => game01.PlayPressed);
        
        string text = "You wake up in the holy city of Elturel. Just moments ago it lay proudly under the " +
                      "forever bright light of the Companion.";
        displayTextOnce(uiTextBox, text);
        yield return new WaitUntil(() => (coroutineRunning == false));
        
        text = "Now it lies half-destroyed in a hellish place with devils crawling around. The Companion " +
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

        text = "Passed.";
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
