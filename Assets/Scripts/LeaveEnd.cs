using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class LeaveEnd : MonoBehaviour
{
    private FadeInOutObject fade;

    // Start is called before the first frame update
    void Start()
    {
        fade = FindObjectOfType<FadeInOutObject>();
        fade.FadeOut();
    }

    // Update is called once per frame
    void Update()
    {

    }

    public void changeToMainMenuScene()
    {
        print("CHANING TO MAIN MENU SCENE");
        UnityEngine.SceneManagement.SceneManager.LoadScene("MainMenu");
    }
}
