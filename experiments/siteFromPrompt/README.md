# Site from Prompt

Dave asked the following:

```text
Thought, demo we could generate rough schema.org descriptions for a website…
What about trying to do a prompt for hydrosheds.org (is that the right one)?
```

The prompt.txt has Dave's initial prompt.  I did remove the line

```
A validator is available at:
```

As I wasn't sure, that tool would work well here.  Though with BAML or DSPy this would be great to add into the mix, I bet.

> Note the generated JSON-LD has comments in it.  This works in 
> some tools and not others, remove them if you get errors 
> about lack of support for JSON Comments.

I fed this into Grok4 which is the only LLM I have access to that has; planning, reasoning and web access.   (though OpenAI dnd Gemini should soon)

The result was a valid schema.org JSON-LD, which is sorta impressing to start with.

I have NOT checked this in any way.   So it could be great or crap. 

There is a lot we can do with the prompt/context engineering to improve this too.   BAML or DSPy approach would likely help the most.


