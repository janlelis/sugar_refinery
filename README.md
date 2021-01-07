# Ruby Sugar Refinery [![version](https://badge.fury.io/rb/sugar_refinery.svg)](https://badge.fury.io/rb/sugar_refinery) [![[ci]](https://github.com/janlelis/sugar_refinery/workflows/Test/badge.svg)](https://github.com/janlelis/sugar_refinery/actions?query=workflow%3ATest)

The Ruby Sugar Refinery is a collection of tiny [refinements](https://ruby-doc.org/core/doc/syntax/refinements_rdoc.html) (declarative local core extensions) for Ruby.

## Setup & usage

Add to Gemfile:

```ruby
gem 'sugar_refinery', require: 'sugar_refinery/all'
```

Then add refinements to the current Ruby file or module:

```ruby
using SugarRefinery::CamelSnake
using SugarRefinery::HashZip

"ClassName".to_snake # => "class_name"
Hash.zip [1,2,3], [4,5,6] # => {1=>4, 2=>5, 3=>6}
```

## List of included refinements

Please see [the documentation](http://janlelis.github.io/sugar_refinery), [the code](https://github.com/janlelis/sugar_refinery/tree/master/lib/sugar_refinery) or [the specs](https://github.com/janlelis/sugar_refinery/tree/master/spec)!

## The Sugar Refinery was Zucker before

This collection of core extensions used to be called **zucker**.

Missing former functionality? It might have been extracted into a separate micro gem:

* [iterate](https://github.com/janlelis/iterate) | Control structure-like iteration
* [instance_variables_from](https://github.com/janlelis/instance_variables_from) | Auto-assign instance variables
* [egonil](https://github.com/janlelis/egonil) | Egocentric nil
* [debugging](https://github.com/janlelis/debugging) | Print debugging helpers
* [procstar](https://github.com/janlelis/procstar) | Beyond symbol2proc
* [ruby_info](https://github.com/janlelis/ruby_info) | Misc information about the Ruby environment
* [ruby_version](https://github.com/janlelis/ruby_version) | Smart Ruby version accessor
* [ruby_engine](https://github.com/janlelis/ruby_engine) | Smar Ruby engine accessor

## J-_-L

Copyright (c) 2010-2016 [Jan Lelis](https://janlelis.com), released under the MIT license
