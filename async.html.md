# The async version


<!-- WARNING: THIS FILE WAS AUTOGENERATED! DO NOT EDIT! -->

## Setup

## Async SDK

``` python
model = models[1]
cli = AsyncAnthropic()
```

``` python
m = {'role': 'user', 'content': "I'm Jeremy"}
r = await cli.messages.create(messages=[m], model=model, max_tokens=100)
r
```

Hi Jeremy! Nice to meet you. I’m Claude, an AI assistant created by
Anthropic. How can I help you today?

<details>

- id: `msg_01UBPA1yCoPZdk4vDbCwdXGm`
- content:
  `[{'text': "Hi Jeremy! Nice to meet you. I'm Claude, an AI assistant created by Anthropic. How can I help you today?", 'type': 'text'}]`
- model: `claude-3-5-sonnet-20241022`
- role: `assistant`
- stop_reason: `end_turn`
- stop_sequence: `None`
- type: `message`
- usage: `{'input_tokens': 10, 'output_tokens': 31}`

</details>

------------------------------------------------------------------------

<a
href="https://github.com/AnswerDotAI/claudette/blob/main/claudette/asink.py#L20"
target="_blank" style="float:right; font-size:smaller">source</a>

### AsyncClient

>  AsyncClient (model, cli=None, log=False)

*Async Anthropic messages client.*

<details open class="code-fold">
<summary>Exported source</summary>

``` python
class AsyncClient(Client):
    def __init__(self, model, cli=None, log=False):
        "Async Anthropic messages client."
        super().__init__(model,cli,log)
        if not cli: self.c = AsyncAnthropic(default_headers={'anthropic-beta': 'prompt-caching-2024-07-31'})
```

</details>

``` python
c = AsyncClient(model)
```

``` python
c._r(r)
c.use
```

    In: 10; Out: 31; Cache create: 0; Cache read: 0; Total: 41

------------------------------------------------------------------------

<a
href="https://github.com/AnswerDotAI/claudette/blob/main/claudette/asink.py#L37"
target="_blank" style="float:right; font-size:smaller">source</a>

### AsyncClient.\_\_call\_\_

>  AsyncClient.__call__ (msgs:list, sp='', temp=0, maxtok=4096, prefill='',
>                            stream:bool=False, stop=None,
>                            tools:Optional[list]=None,
>                            tool_choice:Optional[dict]=None, cli=None,
>                            log=False)

*Make an async call to Claude.*

<table>
<colgroup>
<col style="width: 6%" />
<col style="width: 25%" />
<col style="width: 34%" />
<col style="width: 34%" />
</colgroup>
<thead>
<tr>
<th></th>
<th><strong>Type</strong></th>
<th><strong>Default</strong></th>
<th><strong>Details</strong></th>
</tr>
</thead>
<tbody>
<tr>
<td>msgs</td>
<td>list</td>
<td></td>
<td>List of messages in the dialog</td>
</tr>
<tr>
<td>sp</td>
<td>str</td>
<td></td>
<td>The system prompt</td>
</tr>
<tr>
<td>temp</td>
<td>int</td>
<td>0</td>
<td>Temperature</td>
</tr>
<tr>
<td>maxtok</td>
<td>int</td>
<td>4096</td>
<td>Maximum tokens</td>
</tr>
<tr>
<td>prefill</td>
<td>str</td>
<td></td>
<td>Optional prefill to pass to Claude as start of its response</td>
</tr>
<tr>
<td>stream</td>
<td>bool</td>
<td>False</td>
<td>Stream response?</td>
</tr>
<tr>
<td>stop</td>
<td>NoneType</td>
<td>None</td>
<td>Stop sequence</td>
</tr>
<tr>
<td>tools</td>
<td>Optional</td>
<td>None</td>
<td>List of tools to make available to Claude</td>
</tr>
<tr>
<td>tool_choice</td>
<td>Optional</td>
<td>None</td>
<td>Optionally force use of some tool</td>
</tr>
<tr>
<td>cli</td>
<td>NoneType</td>
<td>None</td>
<td></td>
</tr>
<tr>
<td>log</td>
<td>bool</td>
<td>False</td>
<td></td>
</tr>
</tbody>
</table>

<details open class="code-fold">
<summary>Exported source</summary>

``` python
@patch
async def _stream(self:AsyncClient, msgs:list, prefill='', **kwargs):
    async with self.c.messages.stream(model=self.model, messages=mk_msgs(msgs), **kwargs) as s:
        if prefill: yield prefill
        async for o in s.text_stream: yield o
        self._log(await s.get_final_message(), prefill, msgs, kwargs)
```

</details>

<details open class="code-fold">
<summary>Exported source</summary>

``` python
@patch
@delegates(Client)
async def __call__(self:AsyncClient,
             msgs:list, # List of messages in the dialog
             sp='', # The system prompt
             temp=0, # Temperature
             maxtok=4096, # Maximum tokens
             prefill='', # Optional prefill to pass to Claude as start of its response
             stream:bool=False, # Stream response?
             stop=None, # Stop sequence
             tools:Optional[list]=None, # List of tools to make available to Claude
             tool_choice:Optional[dict]=None, # Optionally force use of some tool
             **kwargs):
    "Make an async call to Claude."
    if tools: kwargs['tools'] = [get_schema(o) for o in listify(tools)]
    if tool_choice: kwargs['tool_choice'] = mk_tool_choice(tool_choice)
    msgs = self._precall(msgs, prefill, stop, kwargs)
    if stream: return self._stream(msgs, prefill=prefill, max_tokens=maxtok, system=sp, temperature=temp, **kwargs)
    res = await self.c.messages.create(
        model=self.model, messages=msgs, max_tokens=maxtok, system=sp, temperature=temp, **kwargs)
    return self._log(res, prefill, msgs, maxtok, sp, temp, stream=stream, stop=stop, **kwargs)
```

</details>

``` python
c = AsyncClient(model, log=True)
c.use
```

    In: 0; Out: 0; Cache create: 0; Cache read: 0; Total: 0

``` python
c.model = models[1]
await c('Hi')
```

Hello! How can I help you today?

<details>

- id: `msg_01TC5wq1bS1ZcJMopq8bZ4o2`
- content:
  `[{'text': 'Hello! How can I help you today?', 'type': 'text'}]`
- model: `claude-3-5-sonnet-20241022`
- role: `assistant`
- stop_reason: `end_turn`
- stop_sequence: `None`
- type: `message`
- usage:
  `{'input_tokens': 8, 'output_tokens': 12, 'cache_creation_input_tokens': 0, 'cache_read_input_tokens': 0}`

</details>

``` python
c.use
```

    In: 8; Out: 12; Cache create: 0; Cache read: 0; Total: 20

``` python
q = "Concisely, what is the meaning of life?"
pref = 'According to Douglas Adams,'
await c(q, prefill=pref)
```

According to Douglas Adams, it’s 42. More seriously, there’s no
universal answer - it’s deeply personal. Common perspectives include:
finding happiness, creating meaning through relationships and
achievements, pursuing knowledge, helping others, or following
spiritual/religious beliefs.

<details>

- id: `msg_012ZvrAoNyBherFi2q4fDRWq`
- content:
  `[{'text': "According to Douglas Adams,  it's 42. More seriously, there's no universal answer - it's deeply personal. Common perspectives include: finding happiness, creating meaning through relationships and achievements, pursuing knowledge, helping others, or following spiritual/religious beliefs.", 'type': 'text'}]`
- model: `claude-3-5-sonnet-20241022`
- role: `assistant`
- stop_reason: `end_turn`
- stop_sequence: `None`
- type: `message`
- usage:
  `{'input_tokens': 24, 'output_tokens': 50, 'cache_creation_input_tokens': 0, 'cache_read_input_tokens': 0}`

</details>

``` python
async for o in (await c('Hi', stream=True)): print(o, end='')
```

    Hello! How can I help you today?

``` python
c.use
```

    In: 40; Out: 74; Cache create: 0; Cache read: 0; Total: 114

``` python
async for o in (await c(q, prefill=pref, stream=True)): print(o, end='')
```

    According to Douglas Adams,  it's 42. More seriously, there's no universal answer - it's deeply personal. Common perspectives include: finding happiness, creating meaning through relationships and achievements, pursuing knowledge, helping others, or following spiritual/religious beliefs.

``` python
c.use
```

    In: 64; Out: 124; Cache create: 0; Cache read: 0; Total: 188

``` python
def sums(
    a:int,  # First thing to sum
    b:int=1 # Second thing to sum
) -> int: # The sum of the inputs
    "Adds a + b."
    print(f"Finding the sum of {a} and {b}")
    return a + b
```

``` python
a,b = 604542,6458932
pr = f"What is {a}+{b}?"
sp = "You are a summing expert."
```

``` python
tools=[get_schema(sums)]
choice = mk_tool_choice('sums')
```

``` python
msgs = mk_msgs(pr)
r = await c(msgs, sp=sp, tools=sums, tool_choice=sums)
tr = mk_toolres(r, ns=globals())
msgs += tr
contents(await c(msgs, sp=sp, tools=sums))
```

    Finding the sum of 604542 and 6458932

    'The sum of 604542 and 6458932 is 7063474.'

``` python
# tools = [get_schema(sums)]
# msgs = mk_msgs(pr)
# r = await c(msgs, sp=sp, tools=tools, tool_choice=choice)
# tr = mk_toolres(r, ns=globals())
# msgs += tr
# contents(await c(msgs, sp=sp, tools=tools))
```

## Structured Output

------------------------------------------------------------------------

<a
href="https://github.com/AnswerDotAI/claudette/blob/main/claudette/asink.py#L60"
target="_blank" style="float:right; font-size:smaller">source</a>

### AsyncClient.structured

>  AsyncClient.structured (msgs:list, tools:Optional[list]=None,
>                              obj:Optional=None,
>                              ns:Optional[collections.abc.Mapping]=None, sp='',
>                              temp=0, maxtok=4096, prefill='',
>                              stream:bool=False, stop=None,
>                              tool_choice:Optional[dict]=None,
>                              metadata:MetadataParam|NotGiven=NOT_GIVEN,
>                              stop_sequences:List[str]|NotGiven=NOT_GIVEN, syst
>                              em:Union[str,Iterable[TextBlockParam]]|NotGiven=N
>                              OT_GIVEN, temperature:float|NotGiven=NOT_GIVEN,
>                              top_k:int|NotGiven=NOT_GIVEN,
>                              top_p:float|NotGiven=NOT_GIVEN,
>                              extra_headers:Headers|None=None,
>                              extra_query:Query|None=None,
>                              extra_body:Body|None=None, timeout:float|httpx.Ti
>                              meout|None|NotGiven=NOT_GIVEN)

*Return the value of all tool calls (generally used for structured
outputs)*

<table>
<colgroup>
<col style="width: 6%" />
<col style="width: 25%" />
<col style="width: 34%" />
<col style="width: 34%" />
</colgroup>
<thead>
<tr>
<th></th>
<th><strong>Type</strong></th>
<th><strong>Default</strong></th>
<th><strong>Details</strong></th>
</tr>
</thead>
<tbody>
<tr>
<td>msgs</td>
<td>list</td>
<td></td>
<td>List of messages in the dialog</td>
</tr>
<tr>
<td>tools</td>
<td>Optional</td>
<td>None</td>
<td>List of tools to make available to Claude</td>
</tr>
<tr>
<td>obj</td>
<td>Optional</td>
<td>None</td>
<td>Class to search for tools</td>
</tr>
<tr>
<td>ns</td>
<td>Optional</td>
<td>None</td>
<td>Namespace to search for tools</td>
</tr>
<tr>
<td>sp</td>
<td>str</td>
<td></td>
<td>The system prompt</td>
</tr>
<tr>
<td>temp</td>
<td>int</td>
<td>0</td>
<td>Temperature</td>
</tr>
<tr>
<td>maxtok</td>
<td>int</td>
<td>4096</td>
<td>Maximum tokens</td>
</tr>
<tr>
<td>prefill</td>
<td>str</td>
<td></td>
<td>Optional prefill to pass to Claude as start of its response</td>
</tr>
<tr>
<td>stream</td>
<td>bool</td>
<td>False</td>
<td>Stream response?</td>
</tr>
<tr>
<td>stop</td>
<td>NoneType</td>
<td>None</td>
<td>Stop sequence</td>
</tr>
<tr>
<td>tool_choice</td>
<td>Optional</td>
<td>None</td>
<td>Optionally force use of some tool</td>
</tr>
<tr>
<td>metadata</td>
<td>MetadataParam | NotGiven</td>
<td>NOT_GIVEN</td>
<td></td>
</tr>
<tr>
<td>stop_sequences</td>
<td>List[str] | NotGiven</td>
<td>NOT_GIVEN</td>
<td></td>
</tr>
<tr>
<td>system</td>
<td>Union[str, Iterable[TextBlockParam]] | NotGiven</td>
<td>NOT_GIVEN</td>
<td></td>
</tr>
<tr>
<td>temperature</td>
<td>float | NotGiven</td>
<td>NOT_GIVEN</td>
<td></td>
</tr>
<tr>
<td>top_k</td>
<td>int | NotGiven</td>
<td>NOT_GIVEN</td>
<td></td>
</tr>
<tr>
<td>top_p</td>
<td>float | NotGiven</td>
<td>NOT_GIVEN</td>
<td></td>
</tr>
<tr>
<td>extra_headers</td>
<td>Headers | None</td>
<td>None</td>
<td></td>
</tr>
<tr>
<td>extra_query</td>
<td>Query | None</td>
<td>None</td>
<td></td>
</tr>
<tr>
<td>extra_body</td>
<td>Body | None</td>
<td>None</td>
<td></td>
</tr>
<tr>
<td>timeout</td>
<td>float | httpx.Timeout | None | NotGiven</td>
<td>NOT_GIVEN</td>
<td></td>
</tr>
</tbody>
</table>

``` python
await c.structured(pr, sums)
```

    Finding the sum of 604542 and 6458932

    [7063474]

## AsyncChat

------------------------------------------------------------------------

<a
href="https://github.com/AnswerDotAI/claudette/blob/main/claudette/asink.py#L77"
target="_blank" style="float:right; font-size:smaller">source</a>

### AsyncChat

>  AsyncChat (model:Optional[str]=None,
>                 cli:Optional[claudette.core.Client]=None, sp='',
>                 tools:Optional[list]=None, temp=0, cont_pr:Optional[str]=None)

*Anthropic async chat client.*

<table>
<colgroup>
<col style="width: 6%" />
<col style="width: 25%" />
<col style="width: 34%" />
<col style="width: 34%" />
</colgroup>
<thead>
<tr>
<th></th>
<th><strong>Type</strong></th>
<th><strong>Default</strong></th>
<th><strong>Details</strong></th>
</tr>
</thead>
<tbody>
<tr>
<td>model</td>
<td>Optional</td>
<td>None</td>
<td>Model to use (leave empty if passing <code>cli</code>)</td>
</tr>
<tr>
<td>cli</td>
<td>Optional</td>
<td>None</td>
<td>Client to use (leave empty if passing <code>model</code>)</td>
</tr>
<tr>
<td>sp</td>
<td>str</td>
<td></td>
<td></td>
</tr>
<tr>
<td>tools</td>
<td>Optional</td>
<td>None</td>
<td></td>
</tr>
<tr>
<td>temp</td>
<td>int</td>
<td>0</td>
<td></td>
</tr>
<tr>
<td>cont_pr</td>
<td>Optional</td>
<td>None</td>
<td></td>
</tr>
</tbody>
</table>

<details open class="code-fold">
<summary>Exported source</summary>

``` python
@delegates()
class AsyncChat(Chat):
    def __init__(self,
                 model:Optional[str]=None, # Model to use (leave empty if passing `cli`)
                 cli:Optional[Client]=None, # Client to use (leave empty if passing `model`)
                 **kwargs):
        "Anthropic async chat client."
        super().__init__(model, cli, **kwargs)
        if not cli: self.c = AsyncClient(model)
```

</details>

``` python
sp = "Never mention what tools you use."
chat = AsyncChat(model, sp=sp)
chat.c.use, chat.h
```

    (In: 0; Out: 0; Cache create: 0; Cache read: 0; Total: 0, [])

------------------------------------------------------------------------

<a
href="https://github.com/AnswerDotAI/claudette/blob/main/claudette/asink.py#L101"
target="_blank" style="float:right; font-size:smaller">source</a>

### AsyncChat.\_\_call\_\_

>  AsyncChat.__call__ (pr=None, temp=0, maxtok=4096, stream=False,
>                          prefill='', **kw)

*Call self as a function.*

<table>
<colgroup>
<col style="width: 6%" />
<col style="width: 25%" />
<col style="width: 34%" />
<col style="width: 34%" />
</colgroup>
<thead>
<tr>
<th></th>
<th><strong>Type</strong></th>
<th><strong>Default</strong></th>
<th><strong>Details</strong></th>
</tr>
</thead>
<tbody>
<tr>
<td>pr</td>
<td>NoneType</td>
<td>None</td>
<td>Prompt / message</td>
</tr>
<tr>
<td>temp</td>
<td>int</td>
<td>0</td>
<td>Temperature</td>
</tr>
<tr>
<td>maxtok</td>
<td>int</td>
<td>4096</td>
<td>Maximum tokens</td>
</tr>
<tr>
<td>stream</td>
<td>bool</td>
<td>False</td>
<td>Stream response?</td>
</tr>
<tr>
<td>prefill</td>
<td>str</td>
<td></td>
<td>Optional prefill to pass to Claude as start of its response</td>
</tr>
<tr>
<td>kw</td>
<td></td>
<td></td>
<td></td>
</tr>
</tbody>
</table>

<details open class="code-fold">
<summary>Exported source</summary>

``` python
@patch
async def _stream(self:AsyncChat, res):
    async for o in res: yield o
    self.h += mk_toolres(self.c.result, ns=self.tools, obj=self)
```

</details>

<details open class="code-fold">
<summary>Exported source</summary>

``` python
@patch
async def _append_pr(self:AsyncChat, pr=None):
    prev_role = nested_idx(self.h, -1, 'role') if self.h else 'assistant' # First message should be 'user' if no history
    if pr and prev_role == 'user': await self()
    self._post_pr(pr, prev_role)
```

</details>

<details open class="code-fold">
<summary>Exported source</summary>

``` python
@patch
async def __call__(self:AsyncChat,
        pr=None,  # Prompt / message
        temp=0, # Temperature
        maxtok=4096, # Maximum tokens
        stream=False, # Stream response?
        prefill='', # Optional prefill to pass to Claude as start of its response
        **kw):
    await self._append_pr(pr)
    res = await self.c(self.h, stream=stream, prefill=prefill, sp=self.sp, temp=temp, maxtok=maxtok, **kw)
    if stream: return self._stream(res)
    self.h += mk_toolres(self.c.result, ns=mk_ns(*listify(self.tools)), obj=self)
    return res
```

</details>

``` python
await chat("I'm Jeremy")
await chat("What's my name?")
```

Your name is Jeremy.

<details>

- id: `msg_01BNxuSzZGanZupYuJxFDTgi`
- content: `[{'text': 'Your name is Jeremy.', 'type': 'text'}]`
- model: `claude-3-5-sonnet-20241022`
- role: `assistant`
- stop_reason: `end_turn`
- stop_sequence: `None`
- type: `message`
- usage:
  `{'input_tokens': 41, 'output_tokens': 8, 'cache_creation_input_tokens': 0, 'cache_read_input_tokens': 0}`

</details>

``` python
q = "Concisely, what is the meaning of life?"
pref = 'According to Douglas Adams,'
await chat(q, prefill=pref)
```

According to Douglas Adams, 42. But more seriously: to find purpose,
create meaning, love, grow, and make a positive impact during our time
here.

<details>

- id: `msg_012WB8YcoMyPk2Uuh69eUxnF`
- content:
  `[{'text': 'According to Douglas Adams,  42. But more seriously: to find purpose, create meaning, love, grow, and make a positive impact during our time here.', 'type': 'text'}]`
- model: `claude-3-5-sonnet-20241022`
- role: `assistant`
- stop_reason: `end_turn`
- stop_sequence: `None`
- type: `message`
- usage:
  `{'input_tokens': 69, 'output_tokens': 31, 'cache_creation_input_tokens': 0, 'cache_read_input_tokens': 0}`

</details>

``` python
chat = AsyncChat(model, sp=sp)
async for o in (await chat("I'm Jeremy", stream=True)): print(o, end='')
```

    Hello Jeremy! Nice to meet you. How are you today?

``` python
pr = f"What is {a}+{b}?"
chat = AsyncChat(model, sp=sp, tools=[sums])
r = await chat(pr)
r
```

7,063,474

<details>

- id: `msg_013c9kT2obX52nLMf9PmWWHH`
- content: `[{'text': '7,063,474', 'type': 'text'}]`
- model: `claude-3-5-sonnet-20241022`
- role: `assistant`
- stop_reason: `end_turn`
- stop_sequence: `None`
- type: `message`
- usage:
  `{'input_tokens': 24, 'output_tokens': 9, 'cache_creation_input_tokens': 0, 'cache_read_input_tokens': 0}`

</details>

``` python
pr += "Say the answer in a sentence."
chat = AsyncChat(model, sp=sp, tools=[sums])
r = await chat(pr)
r
```

The sum of 604,542 and 6,458,932 is 7,063,474.

<details>

- id: `msg_01F6Jms2nhe8VEDN16ZUGomv`
- content:
  `[{'text': 'The sum of 604,542 and 6,458,932 is 7,063,474.', 'type': 'text'}]`
- model: `claude-3-5-sonnet-20241022`
- role: `assistant`
- stop_reason: `end_turn`
- stop_sequence: `None`
- type: `message`
- usage:
  `{'input_tokens': 31, 'output_tokens': 27, 'cache_creation_input_tokens': 0, 'cache_read_input_tokens': 0}`

</details>

``` python
fn = Path('samples/puppy.jpg')
img = fn.read_bytes()
```

``` python
q = "In brief, what color flowers are in this image?"
msg = mk_msg([img, q])
await c([msg])
```

In this adorable puppy photo, there are purple/lavender colored flowers
(appears to be asters or similar daisy-like flowers) in the background.

<details>

- id: `msg_01MLGBSn2QYJoKnthg7W2Tkj`
- content:
  `[{'text': 'In this adorable puppy photo, there are purple/lavender colored flowers (appears to be asters or similar daisy-like flowers) in the background.', 'type': 'text'}]`
- model: `claude-3-5-sonnet-20241022`
- role: `assistant`
- stop_reason: `end_turn`
- stop_sequence: `None`
- type: `message`
- usage:
  `{'input_tokens': 110, 'output_tokens': 37, 'cache_creation_input_tokens': 0, 'cache_read_input_tokens': 0}`

</details>