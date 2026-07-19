using ByteDance.PICO.XR;
using UnityEngine;
using UnityEngine.XR.Interaction.Toolkit.Interactables;

public class EnvironmentInteraction : MonoBehaviour
{
    public StateVariables game01;
    public GameObject rapier;
    public XRGrabInteractable rapierInteractable;
    public GameObject player;
    void Update()
    {
        if (game01.rotateUsed == false) return;
        if (Vector3.Distance(rapier.transform.position, player.transform.position) < 10f) game01.swordFound = true;
        
        if (game01.swordFound == false) return;
        if (rapierInteractable.isSelected)
        {
            game01.swordPickedUp = true;
            Destroy(rapier);
        }
        if (game01.swordPickedUp == false) return;
        
    }
}
