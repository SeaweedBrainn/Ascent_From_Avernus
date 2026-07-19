using UnityEngine;

public class Dice : MonoBehaviour
{
    public int Roll()
    {
        int rolledValue = Random.Range(1, 21);
        return rolledValue;
    }
}
