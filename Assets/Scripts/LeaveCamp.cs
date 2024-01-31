using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class LeaveCamp : MonoBehaviour
{
    private FadeInOutObject fade;

    // Start is called before the first frame update
    void Start()
    {

    }

    // Update is called once per frame
    void Update()
    {

    }

    public void triggerFadeIn()
    {
        fade = FindObjectOfType<FadeInOutObject>();
        fade.FadeIn();
    }

    public void changeToEndScene()
    {
        print("CHANING TO END SCENE");
        UnityEngine.SceneManagement.SceneManager.LoadScene("End");
    }
}
