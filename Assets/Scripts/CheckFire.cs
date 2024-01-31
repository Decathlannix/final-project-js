using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.VFX;

public class CheckFire : MonoBehaviour
{

    [SerializeField] private VisualEffect fire;
    [SerializeField] private GameObject fireLight;
    private const int FIRE_MAX_SPAWN_RATE = 60;
    private const float LIGHT_MAX_INTENSITY = 3.55f;
    private float fire_lerp = 0.0f, fire_lerp_increase = 0.1f, light_lerp = 0.0f, light_lerp_increase = 0.2f;
    private bool firstTimeCheckingQuestComplete = true;

    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        bool done_fire_quest = ((Ink.Runtime.BoolValue) DialogueManager.getInstance().getVariableValue("done_fire_quest")).value;
        if (done_fire_quest)
        {
            fire.SetInt("spawnRate", (int)Mathf.Lerp(0, FIRE_MAX_SPAWN_RATE, fire_lerp));
            fire_lerp += fire_lerp_increase * Time.deltaTime;
            fireLight.GetComponent<Light>().intensity = Mathf.Lerp(0, LIGHT_MAX_INTENSITY, light_lerp);
            light_lerp += light_lerp_increase * Time.deltaTime;

            if (firstTimeCheckingQuestComplete)
            {
                firstTimeCheckingQuestComplete = !firstTimeCheckingQuestComplete;
                GetComponent<AudioSource>().Play();
            }
        }
    }
}
