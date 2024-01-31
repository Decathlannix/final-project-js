using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Ink.Runtime;
using System.IO;

public class DialogueVariables
{

    public Dictionary<string, Ink.Runtime.Object> variables { get; private set; }

    // Necessary as the Globals ink story content isn't compiled in the corresponding JSON file
    public DialogueVariables(TextAsset loadGlobalsJSON)
    {

        Story globalsStory = new Story(loadGlobalsJSON.text);

        // Initialize the dictionary with the content
        variables = new Dictionary<string, Ink.Runtime.Object>();
        foreach (string name in globalsStory.variablesState)
        {
            variables.Add(name, globalsStory.variablesState.GetVariableWithName(name));
            Debug.Log("Initialized global variable: " + name + " = " + globalsStory.variablesState.GetVariableWithName(name));
        }
    }

    public void startListening(Story story)
    {
        // Doesn't work without this line
        saveVariablesToStory(story);
        story.variablesState.variableChangedEvent += variableChanged;
    }

    public void stopListening(Story story)
    {
        story.variablesState.variableChangedEvent -= variableChanged;

    }

    private void variableChanged(string name, Ink.Runtime.Object value)
    {
        Debug.Log("Variable Changed: " + name + " = " + value);
        if (variables.ContainsKey(name))
        {
            variables.Remove(name);
            variables.Add(name, value);
        }
    }

    private void saveVariablesToStory(Story story)
    {
        foreach(KeyValuePair<string, Ink.Runtime.Object> variable in variables)
        {
            story.variablesState.SetGlobal(variable.Key, variable.Value);
        }
    }
}
