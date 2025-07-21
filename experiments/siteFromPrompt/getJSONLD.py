import dspy
import os
from typing import Literal

OAI_API_KEY = os.environ['OPENAI_API_KEY']
gpt_4o_mini = dspy.LM('openai/gpt-4o-mini', api_key=OAI_API_KEY, temperature=0.9, stop=None, cache=False) #  max_tokens=3000,
gpt_4o = dspy.LM('openai/gpt-4o', api_key=OAI_API_KEY, temperature=0.9, stop=None, cache=False) #  max_tokens=3000,

XAI_API_KEY = os.environ['XAI_API_KEY']
xai3 = dspy.LM("xai/grok-3-mini", api_key=XAI_API_KEY, api_base="https://api.x.ai/v1")
xai4 = dspy.LM("xai/grok-4-0709", api_key=XAI_API_KEY, api_base="https://api.x.ai/v1", temperature=0.9, stop=None, cache=False) # , temperature=0.9, stop=None, cache=False) #  max_tokens=3000,

NRP_API_KEY = os.environ['NRP_API_KEY']
nrp_gemma3 = dspy.LM('openai/gemma3', api_key=NRP_API_KEY, api_base='https://llm.nrp-nautilus.io', stop=None, cache=False) # use the openai-/* for openai compatable API call methods on open models via litellm
nrp_deepseek_r1 = dspy.LM('openai/deepseek-r1', api_key=NRP_API_KEY, api_base='https://llm.nrp-nautilus.io', stop=None, cache=False) # use the openai-/* for openai compatable API call methods on open models via litellm

dspy.configure(lm=nrp_deepseek_r1)

# Open the file in read mode ('r')
with open('prompt.txt', 'r') as file:
    # Read the entire content into a variable
    myprompt = file.read()

# qa = dspy.ChainOfThought('question -> answer')
qa = dspy.Predict('question -> answer')


# Run with the default LM configured with `dspy.configure` above.
response = qa(question=myprompt)
print(response.answer)
