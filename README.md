# simple_navigation

Simple named route navigation that unofficially addresses Flutter issue 11655 ("build needlessly called for non-current screens lower on stack")


## Simplifications

- for simplicity of development, navigation is static
- don't need to pass context
- class named 'Nav' instead of 'Navigation' because it's shorter


## Limitations

- since static, can't have multiple instances



## TODO

- use generics for arguments: either Object (standard) or Map (my preference)
- force redraw entire tree (not sure if possible)
- overrides
- pop all the way out of application (configure yes/no)
- test: hot reload doesn't erase stack
- solve: object vs. named route problem


## Pull Request

- encouraged!
