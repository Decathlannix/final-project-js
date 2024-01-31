using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlayerFollow : MonoBehaviour
{

    public Transform playerTransform;
    private Vector3 cameraOffset;

    // Start is called before the first frame update
    void Start()
    {
        cameraOffset = transform.position - playerTransform.position;
    }

    private void LateUpdate()
    {
        Vector3 newPosition = playerTransform.position + cameraOffset;
        transform.position = new Vector3(newPosition.x, newPosition.y, newPosition.z);
    }

    // Update is called once per frame
    void Update()
    {
        
    }
}
