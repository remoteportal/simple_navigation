# simple_navigation

Simple named route navigation that unofficially addresses Flutter issue 11655 ("build needlessly called for non-current screens lower on stack")



## Limitations

- for simplicity of development, navigation is static (can't have more than once instance)



## TODO

- use generics for arguments: either Object (standard) or Map (my preference)
- force redraw entire tree (not sure if possible)
- overrides
- pop all the way out of application (configure yes/no)
- test: hot reload doesn't erase stack


## Pull Request

- encouraged!
