using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Events;
using UnityEngine.InputSystem;

public class Player : MonoBehaviour
{

    private Vector3 movement;
    private Rigidbody rb;
    private Animator animator;
    public UnityEvent onPressInteract;
    public UnityEvent onPressDialogue;

    // Start is called before the first frame update
    void Start()
    {
        rb = GetComponent<Rigidbody>();
        animator = GetComponent<Animator>();
    }

    private void FixedUpdate()
    {
        if (!(DialogueManager.getInstance().dialogueIsPlaying))
        {
            rb.MovePosition(rb.position + movement * Time.fixedDeltaTime);
            if (movement != Vector3.zero)
            {
                transform.forward = movement;
                animator.SetBool("isMoving", true);
            }
            else
            {
                animator.SetBool("isMoving", false);
            }
        } else
        {
            if (animator.GetBool("isMoving"))
            {
                animator.SetBool("isMoving", false);
            }
        }
    }

    // Update is called once per frame
    void Update()
    {
     
    }

    private void OnMovement(InputValue value)
    {
        movement = value.Get<Vector3>();
    }

    private void OnInteract(InputValue value) 
    {
        print("Interact");
        onPressInteract.Invoke();
    }

    private void OnDialogue(InputValue value)
    {
        print("Dialogue");
        onPressDialogue.Invoke();
    }
}
