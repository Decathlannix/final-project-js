using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using TMPro;
using Ink.Runtime;
using UnityEngine.EventSystems;
using UnityEditor;
using UnityEngine.UI;
using System.Linq;

public class DialogueManager : MonoBehaviour
{
    private static DialogueManager instance;
    private Story story;
    private DialogueVariables variables;
    [SerializeField] private GameObject dialoguePanel;
    [SerializeField] private GameObject[] inventorySlots;
    [SerializeField] private List<Texture> inventoryIcons;
    [SerializeField] private TextMeshProUGUI dialogueText;
    [SerializeField] private TextMeshProUGUI[] choices;
    [SerializeField] private TextAsset loadGlobalsJSON;

    public bool dialogueIsPlaying { get; private set; }

    private void Awake()
    {
        if (instance != null)
        {
            Debug.Log("Found more than one DialogueManager in the scene");
        }
        instance = this;
    }

    public static DialogueManager getInstance()
    {
        return instance;
    }

    private void Start()
    {
        variables = new DialogueVariables(loadGlobalsJSON);
        dialogueIsPlaying = false;
        dialoguePanel.SetActive(false);
        int index = 0;
        foreach (TextMeshProUGUI choice in choices)
        {
            choice.transform.parent.gameObject.SetActive(false);
            index++;
        }
    }

    public void StartCampNarrative(TextAsset inkJSON)
    {
        EnterDialogueMode(inkJSON);
    }

    public void EnterDialogueMode(TextAsset inkJSON)
    {
        story = new Story(inkJSON.text);
        variables.startListening(story);

        dialogueIsPlaying = true;
        dialoguePanel.SetActive(true);

        continueStory();
    }

    private void ExitDialogueMode()
    {
        variables.stopListening(story);
        dialogueIsPlaying = false;
        dialoguePanel.SetActive(false);
        print("FALSE2");
        dialogueText.text = "";
        int index = 0;
        foreach (TextMeshProUGUI choice in choices)
        {
            choice.transform.parent.gameObject.SetActive(false);
            index++;
        }
    }

    private void continueStory()
    {
        if (story.canContinue)
        {
            print("Can Continue");
            dialogueText.text = story.Continue();
            if (dialogueText.text.Equals("") && !story.canContinue)
            {
                ExitDialogueMode();
            }
            displayChoices();
            handleTags();
        }
        else
        {
            print("Cant Continue");
            ExitDialogueMode();
        }
    }

    private void displayChoices()
    {
        List<Choice> storyChoices = story.currentChoices;

        if (storyChoices.Count > choices.Length)
        {
            Debug.Log("More choices were given than the UI can support. Number of choices given: " + storyChoices.Count);
        }

        int index = 0;
        foreach (Choice choice in storyChoices)
        {
            choices[index].transform.parent.gameObject.SetActive(true);
            if (EventSystem.current.currentSelectedGameObject != null)
                EventSystem.current.SetSelectedGameObject(null);
            choices[index].text = choice.text;
            index++;
        }

        for (int i = index; i < choices.Length; i++)
        {
            choices[i].transform.parent.gameObject.SetActive(false);
        }
    }

    public void makeChoice(int choiceIndex)
    {
        print("Index: " + choiceIndex);
        story.ChooseChoiceIndex(choiceIndex);
    }

    public void handleTags()
    {
        List<string> tags = story.currentTags;

        foreach(string tag in tags)
        {
            string[] splitTag = tag.Split(':');
            if (splitTag.Length != 2)
            {
                Debug.Log("Tag could not be parsed correctly: " + tag);
            }
            string key = splitTag[0].Trim();
            bool value = bool.Parse(splitTag[1].Trim());
            print("KEYVALUE - " + key + ": " + value);
            handleKeyValue(key, value);
        }
    }

    public void handleKeyValue(string key, bool value)
    {
        if (value)
        {
            switch (key) {
                case "End":
                    LeaveCamp leaveCampObject = FindObjectOfType<LeaveCamp>();
                    leaveCampObject.triggerFadeIn();
                    break;
                default:
                    GameObject slotToAddIconTo = inventorySlots.FirstOrDefault(slot => slot.GetComponent<RawImage>().texture == null);
                    slotToAddIconTo.GetComponent<RawImage>().texture = inventoryIcons.FirstOrDefault(icon => icon.name == key);
                    break;
            }
        }
        else
        {
            GameObject slotToRemoveIconFrom = inventorySlots.FirstOrDefault(slot => slot.GetComponent<RawImage>().texture != null && slot.GetComponent<RawImage>().texture.name == key);
            slotToRemoveIconFrom.GetComponent<RawImage>().texture = null;
        }
    }


    public void Dialogue()
    {
        print("Dialogue2");
        if (!dialogueIsPlaying)
        {
            print("Dialogue3");
            return;
        } else if (story.currentChoices.Count == 0)
        {
            print("Dialogue4");
            continueStory();
        }
        print("Dialogue5");
    }

    // Fetch the corresponding value of a global variable in the story
    public Ink.Runtime.Object getVariableValue(string name)
    {
        Ink.Runtime.Object value = null;
        variables.variables.TryGetValue(name, out value);
        if (value == null)
        {
            Debug.Log("Null Ink Variable: " + name);
        }
        return value;
    }
}
