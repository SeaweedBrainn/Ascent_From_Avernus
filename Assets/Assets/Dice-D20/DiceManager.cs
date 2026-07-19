using UnityEngine;

public class DiceManager : MonoBehaviour
{
    public GameObject dicePrefab; // Reference to the dice prefab
    public Transform spawnPoint; // Reference to the spawn point for the dice
    public Material defaultMaterial; // Reference to the default material for the dice
    public Material rolledMaterial; // Reference to the material for the rolled dice
    public void RollDice()
    {
        // Instantiate a new dice at the spawn point
        GameObject newDice = Instantiate(dicePrefab, spawnPoint.position, Quaternion.identity);
        newDice.tag = "Dice"; // Tag the dice for identification

        // Get the Dice component from the instantiated dice
        Dice diceComponent = newDice.GetComponent<Dice>();
        if (diceComponent == null)
        {
            diceComponent = newDice.AddComponent<Dice>();
        }

        // Roll the dice and get the result
        result = diceComponent.Roll();

        // Change the material of the rolled dice to indicate it has been rolled
        Renderer diceRenderer = newDice.GetComponent<Renderer>();
        if (diceRenderer != null && rolledMaterial != null)
        {
            diceRenderer.material = rolledMaterial;
        }

        isRolling = true; // Set the rolling flag to true
    }

    public void ResetDice()
    {
        // Find all dice in the scene and destroy them
        GameObject[] diceObjects = GameObject.FindGameObjectsWithTag("Dice");
        foreach (GameObject dice in diceObjects)
        {
            Destroy(dice);
        }
    }

    public void RollAndResetDice()
    {
        ResetDice(); // Reset any existing dice
        RollDice(); // Roll a new dice
    }

    private int result; // Variable to store the result of the dice roll
    private bool isRolling; // Flag to indicate if the dice is currently rolling

    // Start is called once before the first execution of Update after the MonoBehaviour is created
    void Start()
    {
        dicePrefab = Resources.Load<GameObject>("DicePrefab"); // Load the dice prefab from the Resources folder
        spawnPoint = GameObject.Find("DiceSpawnPoint").transform; // Find the spawn point in the scene
        defaultMaterial = Resources.Load<Material>("DefaultMaterial"); // Load the default material from the Resources folder
        rolledMaterial = Resources.Load<Material>("RolledMaterial"); // Load the rolled material from the Resources folder
    }

    // Update is called once per frame
    void Update()
    {
        //get collider with tag if the collider hits the dice then roll the dice
        Collider collider = GetComponent<Collider>();
        if (collider != null && collider.CompareTag("Dice"))
        {

            Rigidbody diceRigidbody = GameObject.FindGameObjectWithTag("Dice")?.GetComponent<Rigidbody>();
            if (diceRigidbody != null && diceRigidbody.linearVelocity.magnitude < 0.1f)
            {
                isRolling = false; // Set the rolling flag to false
                Debug.Log("Dice rolled: " + result); // Log the result of the dice roll
            }
        }
    }
}
