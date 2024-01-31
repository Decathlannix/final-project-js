using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class MainMenuInteraction : MonoBehaviour
{

    private Outline outline;
    private AudioSource audioSource;

    // Start is called before the first frame update
    void Start()
    {
        outline = GetComponent<Outline>();
        audioSource = GetComponent<AudioSource>();
    }

    // Update is called once per frame
    void Update()
    {
        
    }

    private void OnMouseDown()
    {
        switch (this.gameObject.tag)
        {
            case "StartGame":
                // Move to main game
                UnityEngine.SceneManagement.SceneManager.LoadScene("Intro");
                break;
            case "Credits":
                // Move to credits page
                UnityEngine.SceneManagement.SceneManager.LoadScene("Credits");
                break;
            case "Exit":
                // End game
                Application.Quit();
                break;
        }
    }

    private void OnMouseEnter()
    {
        outline.enabled = true;
        audioSource.Play();
    }

    private void OnMouseExit()
    {
        outline.enabled = false;
        audioSource.Stop();
    }

}
