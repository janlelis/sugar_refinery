# Ruby Zucker [![version](https://badge.fury.io/rb/zucker.svg)](http://badge.fury.io/rb/zucker) [![travis](https://travis-ci.org/janlelis/zucker.png?branch=master)](https://travis-ci.org/janlelis/zucker)

Lots of small refinements to sweeten your Ruby code.

[Documentation](http://janlelis.github.io/zucker)

## Example

```ruby
require 'zucker/camel_snake'
using Zucker::CamelSnake
'was_snake_string'.to_camel # => 'WasSnakeString'
'WasCamelString'.to_snake # => 'was_camel_string'
```

## Changes

Missing former functionality? It might have been extracted to separate gems:

* [debugging](https://github.com/janlelis/debugging)
* [procstar](https://github.com/janlelis/procstar)
* [ruby_info](https://github.com/janlelis/ruby_info)
* [ruby_version](https://github.com/janlelis/ruby_version)
* [ruby_engine](https://github.com/janlelis/ruby_engine)

Copyright (c) 2010-2015 Jan Lelis | http://janlelis.de | Released under the MIT license
