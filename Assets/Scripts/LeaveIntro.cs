using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class LeaveIntro : MonoBehaviour
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

    private void OnEnable()
    {
        fade = FindObjectOfType<FadeInOutObject>();
        fade.FadeIn();
    }

    public void changeToCampScene()
    {
        UnityEngine.SceneManagement.SceneManager.LoadScene("Camp");
    }
}
