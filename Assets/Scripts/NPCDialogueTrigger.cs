using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class NPCDialogueTrigger : MonoBehaviour
{

    private Outline outline;
    [SerializeField] private TextAsset inkJSON;

    // Start is called before the first frame update
    void Start()
    {
        outline = GetComponent<Outline>();
    }

    // Update is called once per frame
    void Update()
    {
        
    }

    private void OnTriggerEnter(Collider other)
    {
        outline.enabled = true;
    }

    private void OnTriggerExit(Collider other)
    {
        outline.enabled = false;
    }

    public void Interact()
    {
        if (outline.enabled) {
            DialogueManager.getInstance().EnterDialogueMode(inkJSON);
        }
    }
}
