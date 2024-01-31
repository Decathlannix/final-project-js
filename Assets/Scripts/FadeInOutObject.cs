using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Events;
using UnityEngine.SceneManagement;

public class FadeInOutObject : MonoBehaviour
{

    public float alpha;
    public UnityEvent onChangeToCampScene;
    public UnityEvent onChangeToEndScene;
    public UnityEvent onStartCampNarrative;
    public UnityEvent onStartEndScene;

    private bool fadeIn = false;
    private bool fadeOut = false;
    private float timeToFade = 0.2f;

    private Renderer renderer;
    private CanvasGroup canvasGroup;

    // Start is called before the first frame update
    void Start()
    {

    }

    // Update is called once per frame
    void Update()
    {
        switch (gameObject.tag)
        {
            case "Intro": // Intro scene text pieces
                renderer = GetComponent<Renderer>();
                renderer.material.color = new Color(renderer.material.color.r, renderer.material.color.g, renderer.material.color.b, alpha);
                break;
            case "BlackScreen": // Other fade in/out objects for scene transition
                canvasGroup = GetComponent<CanvasGroup>();
                if (fadeIn && canvasGroup.alpha < 1)
                {
                    canvasGroup.alpha += timeToFade * Time.deltaTime;
                    if (canvasGroup.alpha >= 1)
                    {
                        fadeIn = false;
                        if (SceneManager.GetActiveScene().name.CompareTo("Intro") == 0)
                        {
                            onChangeToCampScene.Invoke();
                        } 
                        else if(SceneManager.GetActiveScene().name.CompareTo("Camp") == 0)
                        {
                            onChangeToEndScene.Invoke();
                        }
                    }
                }
                if(fadeOut && canvasGroup.alpha > 0)
                {
                    canvasGroup.alpha -= timeToFade * Time.deltaTime;
                    if (canvasGroup.alpha <= 0)
                    {
                        fadeOut = false;
                        if (SceneManager.GetActiveScene().name.CompareTo("Camp") == 0)
                        {
                            onStartCampNarrative.Invoke();
                        }
                        else if (SceneManager.GetActiveScene().name.CompareTo("End") == 0)
                        {
                            onStartEndScene.Invoke();
                        }
                    }
                }
                break;
        }
    }

    public void FadeIn()
    {
        fadeIn = true;
    }

    public void FadeOut()
    {
        fadeOut = true;
    }
}
