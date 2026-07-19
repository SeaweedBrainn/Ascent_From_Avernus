using UnityEngine;
using System.Collections;

public class DiceManager : MonoBehaviour
{
    public GameObject dicePrefab;
    public Transform spawnPoint;
    public Material defaultMaterial;
    public Material rolledMaterial;

    [Header("Spin Settings")]
    public float spinDuration = 1.2f;       // how long the fake spin lasts
    public float spinSpeed = 720f;          // degrees per second, tune to taste
    public AnimationCurve spinEase = AnimationCurve.EaseInOut(0, 1, 1, 0); // slows down toward the end

    private GameObject currentDice;
    public int result;
    public bool isRolling;

    public void AddDice()
    {
        currentDice = Instantiate(dicePrefab, spawnPoint.position, Quaternion.identity);
        currentDice.tag = "Dice";
    }
    
    public void RollDice()
    {
        if (isRolling) return; // prevent spamming while mid-spin

        Dice diceComponent = currentDice.GetComponent<Dice>();
        if (diceComponent == null)
            diceComponent = currentDice.AddComponent<Dice>();

        result = diceComponent.Roll(); // result is already decided

        Renderer diceRenderer = currentDice.GetComponent<Renderer>();
        if (diceRenderer != null && defaultMaterial != null)
            diceRenderer.material = defaultMaterial; // looks "unrolled" while spinning

        StartCoroutine(SpinThenReveal(diceRenderer));
    }

    private IEnumerator SpinThenReveal(Renderer diceRenderer)
    {
        isRolling = true;
        float elapsed = 0f;

        while (elapsed < spinDuration)
        {
            float t = elapsed / spinDuration;
            float speedMultiplier = spinEase.Evaluate(t); // eases the spin to a stop
            float frameSpin = spinSpeed * speedMultiplier * Time.deltaTime;

            // spin on a couple axes so it doesn't look like a flat rotation
            currentDice.transform.Rotate(new Vector3(frameSpin, frameSpin * 0.7f, 0f), Space.Self);

            elapsed += Time.deltaTime;
            yield return null;
        }

        // snap to a clean resting rotation and reveal
        currentDice.transform.rotation = Quaternion.identity;

        if (diceRenderer != null && rolledMaterial != null)
            diceRenderer.material = rolledMaterial;

        Debug.Log("Dice rolled: " + result);
        isRolling = false;
    }

    public void ResetDice()
    {
        GameObject[] diceObjects = GameObject.FindGameObjectsWithTag("Dice");
        foreach (GameObject dice in diceObjects)
            Destroy(dice);

        currentDice = null;
        isRolling = false;
    }

    public void RollAndResetDice()
    {
        ResetDice();
        RollDice();
    }
}