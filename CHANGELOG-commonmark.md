

# Release notes

<!-- do not remove -->

## 0.3.10

### Bugs Squashed

- `find_blocks` does not handle dicts
  ([\#96](https://github.com/AnswerDotAI/claudette/issues/96))

## 0.3.7

### New Features

- Add Haiku and Sonnet 4.5
  ([\#95](https://github.com/AnswerDotAI/claudette/issues/95))

## 0.3.6

### New Features

- Support opus 4.1
  ([\#93](https://github.com/AnswerDotAI/claudette/issues/93))

## 0.3.5

### New Features

- Support async functions in async toolloop
  ([\#92](https://github.com/AnswerDotAI/claudette/issues/92))

## 0.3.4

### Bugs Squashed

- Escape Quotes in markdown footnotes
  ([\#90](https://github.com/AnswerDotAI/claudette/pull/90)), thanks to
  [@ncoop57](https://github.com/ncoop57)

## 0.3.2

### New Features

- Suport for tool functions returning `ToolResult` image values
  ([\#88](https://github.com/AnswerDotAI/claudette/pull/88)), thanks to
  [@austinvhuang](https://github.com/austinvhuang)

## 0.3.1

### New Features

- Use msglm 0.0.9
  ([\#87](https://github.com/AnswerDotAI/claudette/issues/87))

## 0.3.0

### Breaking Changes

- Remove `obj` support
  ([\#85](https://github.com/AnswerDotAI/claudette/issues/85))

## 0.2.2

### New Features

- Make full messages available after streaming
  ([\#84](https://github.com/AnswerDotAI/claudette/issues/84))

## 0.2.0

### Breaking Changes

- `toolloop` now returns an iterator of every message, including each
  tool request and result

### New Features

- Add tool call results to toolloop result
  ([\#83](https://github.com/AnswerDotAI/claudette/issues/83))
- `show_thk` param for `contents`
  ([\#82](https://github.com/AnswerDotAI/claudette/issues/82))

## 0.1.11

### New Features

- Use updated text editor tool
  ([\#80](https://github.com/AnswerDotAI/claudette/issues/80))
- Skip hidden directories in `view()`

## 0.1.10

### New Features

- Support Claude 4
  ([\#79](https://github.com/AnswerDotAI/claudette/issues/79))

## 0.1.9

### New Features

- Tool loop now continues when function calls return an error
  ([\#78](https://github.com/AnswerDotAI/claudette/pull/78)), thanks to
  [@erikgaas](https://github.com/erikgaas)
- feat: add text editor tool implementation
  ([\#71](https://github.com/AnswerDotAI/claudette/pull/71)), thanks to
  [@ncoop57](https://github.com/ncoop57)

## 0.1.8

### New Features

- Add exhausted tool loop warning
  ([\#75](https://github.com/AnswerDotAI/claudette/issues/75))
- Text editor tool implementation
  ([\#71](https://github.com/AnswerDotAI/claudette/pull/71)), thanks to
  [@ncoop57](https://github.com/ncoop57)
- Async tool loop
  ([\#70](https://github.com/AnswerDotAI/claudette/issues/70))
- Pre-serialized funcs in tool calling
  ([\#67](https://github.com/AnswerDotAI/claudette/pull/67)), thanks to
  [@erikgaas](https://github.com/erikgaas)
- Extended Thinking
  ([\#66](https://github.com/AnswerDotAI/claudette/issues/66))

## 0.1.7

### Bugs Squashed

- Bump required `msglm` version

## 0.1.6

### Bugs Squashed

- Bump required `anthropic` version

## 0.1.5

### New Features

- add extended thinking
  ([\#65](https://github.com/AnswerDotAI/claudette/pull/65)), thanks to
  [@comhar](https://github.com/comhar)
- Make Sonnet 3.7 the default sonnet model
  ([\#63](https://github.com/AnswerDotAI/claudette/issues/63))
- Add model capabilities attributes `has_streaming_models`,
  `has_temperature_models`, and `has_system_prompt_models`
  ([\#57](https://github.com/AnswerDotAI/claudette/pull/57)), thanks to
  [@austinvhuang](https://github.com/austinvhuang)

### Bugs Squashed

- fix bedrock usage reporting
  ([\#60](https://github.com/AnswerDotAI/claudette/pull/60)), thanks to
  [@hamelsmu](https://github.com/hamelsmu)

## 0.1.3

### New Features

- add caching to async client too
  ([\#55](https://github.com/AnswerDotAI/claudette/pull/55)), thanks to
  [@bclavie](https://github.com/bclavie)

## 0.1.2

### New Features

- Add continuously-updated cache support to Chat and Client
  ([\#54](https://github.com/AnswerDotAI/claudette/pull/54)), thanks to
  [@bclavie](https://github.com/bclavie)
- Enhance AsyncChat with improved tool support and message handling
  ([\#52](https://github.com/AnswerDotAI/claudette/pull/52)), thanks to
  [@ncoop57](https://github.com/ncoop57)
- Add support for user defined types in tool calling functions
  ([\#51](https://github.com/AnswerDotAI/claudette/pull/51)), thanks to
  [@austinvhuang](https://github.com/austinvhuang)
- Add detailed cost breakdown and improve content handling
  ([\#49](https://github.com/AnswerDotAI/claudette/pull/49)), thanks to
  [@ncoop57](https://github.com/ncoop57)

## 0.1.1

### New Features

- add structured to async
  ([\#48](https://github.com/AnswerDotAI/claudette/pull/48)), thanks to
  [@hamelsmu](https://github.com/hamelsmu)
- add `msglm`
  ([\#46](https://github.com/AnswerDotAI/claudette/pull/46)), thanks to
  [@comhar](https://github.com/comhar)
- Add support for new Claude 3.5 Haiku model
  ([\#44](https://github.com/AnswerDotAI/claudette/pull/44)), thanks to
  [@ncoop57](https://github.com/ncoop57)
- trace history instead of chat response in toolloop
  ([\#39](https://github.com/AnswerDotAI/claudette/pull/39)), thanks to
  [@comhar](https://github.com/comhar)

## 0.1.0

### Breaking Changes

- `tool_choice` is no longer a `Chat` instance variable; instead it is a
  parameter to `Chat.__call__`

### New Features

- Add `temp` param to `Chat`
  ([\#38](https://github.com/AnswerDotAI/claudette/issues/38))

### Bugs Squashed

- `pr` included but not used
  ([\#37](https://github.com/AnswerDotAI/claudette/issues/37))
- fix tool use bug
  ([\#35](https://github.com/AnswerDotAI/claudette/pull/35)), thanks to
  [@comhar](https://github.com/comhar)

## 0.0.10

### New Features

- Add `Client.structured`
  ([\#32](https://github.com/AnswerDotAI/claudette/issues/32))
- Use `dict2obj`
  ([\#30](https://github.com/AnswerDotAI/claudette/issues/30))
- Store tool call result without stringifying
  ([\#29](https://github.com/AnswerDotAI/claudette/issues/29))

## 0.0.9

### New Features

- Async support
  ([\#21](https://github.com/AnswerDotAI/claudette/issues/21))

## 0.0.7

### New Features

- Prompt caching
  ([\#20](https://github.com/AnswerDotAI/claudette/issues/20))
- add markdown to doc output
  ([\#19](https://github.com/AnswerDotAI/claudette/issues/19))
- Support vscode details tags
  ([\#18](https://github.com/AnswerDotAI/claudette/issues/18))
- Add a `cont_pr` param to Chat as a “default” prompt
  [\#15](https://github.com/AnswerDotAI/claudette/pull/15)), thanks to
  [@tom-pollak](https://github.com/tom-pollak)

### Bugs Squashed

- Explicit `tool_choice` causes chat() to call tool twice.
  ([\#11](https://github.com/AnswerDotAI/claudette/issues/11))

## 0.0.6

### New Features

- Default chat prompt & function calling refactor
  ([\#15](https://github.com/AnswerDotAI/claudette/pull/15)), thanks to
  [@tom-pollak](https://github.com/tom-pollak)

## 0.0.5

### New Features

- Better support for stop sequences
  ([\#12](https://github.com/AnswerDotAI/claudette/pull/12)), thanks to
  [@xl0](https://github.com/xl0)

## 0.0.3

### New Features

- Amazon Bedrock and Google Vertex support
  ([\#7](https://github.com/AnswerDotAI/claudette/issues/7))

### Bug Fixes

- Update model paths for non-beta tool use
  ([\#2](https://github.com/AnswerDotAI/claudette/pull/2)), thanks to
  [@sarahpannn](https://github.com/sarahpannn)

## 0.0.1

- Initial release
