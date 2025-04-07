# Page Inspector

## About

Some work inspired by Dave's demo last week.  

## Notes

Currently the best place to play with BAML is in VSCode with the BAML plugin at: https://marketplace.visualstudio.com/items?itemName=Boundary.baml-extension

Learn more about BAML at: https://docs.boundaryml.com/guide/installation-language/python 

You will need to set your OpenAI key

```json
export OPENAI_API_KEY="myKeyToTheAIOverlord"
```

We need to modify this code to use Ollama and try out the new LLama 4 or some 
of the other models.  So we don't need a key.  You can put in new
llms in  [the clients code](baml_src/clients.baml).

The two functions are: [ExtractDataset](baml_src/dataset.baml) and [ExtractPage](baml_src/page.baml)

ExtractDataset is for processing a page with links to dataset distributions.

The ExtractPage is for a general information page.  

run with:

```json
python main.py
```
