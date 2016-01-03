# Ruby Sugar Refinery [![version](https://badge.fury.io/rb/sugar_refinery.svg)](http://badge.fury.io/rb/sugar_refinery) [![travis](https://travis-ci.org/janlelis/sugar_refinery.png?branch=master)](https://travis-ci.org/janlelis/sugar_refinery)

The Ruby Sugar Refinery is a collection of tiny [refinements](http://ruby-doc.org/core-2.3.0/doc/syntax/refinements_rdoc.html) (declarative local core extensions) for Ruby.

## Setup & Usage

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

## Included Refinements

[See the documentation!](http://janlelis.github.io/sugar_refinery)

## Zucker Gems

Missing former functionality? It might have been extracted into a separate gem:

* [iterate](https://github.com/janlelis/iterate)
* [instance_variable_from](https://github.com/janlelis/instance_variable_from)
* [egonil](https://github.com/janlelis/egonil)
* [debugging](https://github.com/janlelis/debugging)
* [procstar](https://github.com/janlelis/procstar)
* [ruby_info](https://github.com/janlelis/ruby_info)
* [ruby_version](https://github.com/janlelis/ruby_version)
* [ruby_engine](https://github.com/janlelis/ruby_engine)

## J-_-L

Copyright (c) 2010-2016 [Jan Lelis](http://janlelis.com), released under the MIT license
