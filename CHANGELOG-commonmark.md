

# Release notes

<!-- do not remove -->

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