# simple_navigation

Simple named route navigation that unofficially addresses Flutter issue 11655 ("build needlessly called for non-current screens lower on stack").

I consider issue 11655 to be the single biggest problem with the Flutter widget build mechanism; it really bothers me so I felt compelled to roll my own solution.

THIS PACKAGE ISN'T FOR EVERYONE.   I prefer the navigation approach implemented herein but it's non-standard.

_Warning:  This package is an active proof of concept--under active development--and may change drastically at any time._



## Simplifications

- for simplicity of development, navigation is static
- don't need to pass context
- class named 'Nav' instead of 'Navigation' because it's shorter


## Limitations

- since static, can't have multiple instances
- doesn't work with showDialog() return values
- doesn't work with Hero widget


## Features

- backButtonCaption with callback function 


## TODO

- use generics for arguments: either Object (standard) or Map (my preference)
- force redraw entire tree (not sure if possible)
- pop all the way out of application (configure yes/no)
- test: hot reload doesn't erase stack
- solve: object vs. named route problem
- pass in trace flag to constructor
- return values? (friends showDialog... pop(return))


## Pull Request

Pull requests are welcome!
