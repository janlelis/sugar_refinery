# Sugar Refinery Changelog

## 2016-01-01 | Sugar Refinery 1.0
* Turn zucker gem into sugar_refinery


## CHANGELOG FOR ZUCKER GEM

2015-04-01 | Zucker 100.1.0
* drop Ruby 1.9 support
* add float_extras for Float#same?
* add chain_map
* add inner_map
* add array_stats


2014-04-01 | Zucker 100.0.0
* drop Ruby 1.8 support
* rewrite zucker to use refinements!
* use usual semantic versioning
* remove all "debug" cubes, use the "debugging" gem instead!
* remove "ruby_version" cube, use the "ruby_version" gem instead!
* remove "engine" cube, use the "ruby_engine" gem instead!
* remove "info" cube, use the "ruby_info" gem instead!
* remove "os" cube, use rdp's "os" gem instead!
* remove "*_to_proc" cubes, use the "procstar" gem instead!
* remove "sandbox" cube, since sandboxing is not recommended and removed from Ruby 2.1
* remove "kernel" and "not" cube completely
* tweaks to most other cubes


2013-04-30 | Zucker 13
* fix alias_for bug
* let RubyVersion#inspect and RubyEngine#inspect map to #to_s
* remove Array#sum
* repackage (gh#4)


2012-01-16 | Zucker 12
* fix a requiring bug
* rename zucker/version cube to zucker/ruby_version and Zucker::PACKAGES to Zucker::PACKS
* remove more_aliases! (keep it simple...)
* add case cube: String#to_camel and String#to_snake


2011-05-25 | Zucker 11
* add Zucker::constants to check if cube has been required (e.g. Zucker::AliasFor if 'zucker/alias_for' is loaded)
* rbx tweaks
  * don't define Binding#vars on rbx (prevent endless recursion)
  * sandbox-not-working warning
* add Kernel#ignore_sigquit!
* fix warnings
* doc tweaks


2011-04-29 | Zucker 10
* doc/spec tweaks
  * make test.rubygems.org-testable
* fix zucker 9 permission issue


2011-01-22 | Zucker 9
* remove history versions (sorry, it caused too much gem/rdoc troubles)
* add file cube: File.delete! and File.gsub
* debug pack improvements
  * binding: typos + return nil
  * cc: support for ripl + return nil
  * mm: also show eigenclass for modules + nicer displaying + return nil
  * added Regexp#visualize
* remove optional sandbox param
* rename xxx2proc to xxx_to_proc
* change rakefile/rspec/gemspec structure
* more minor fixes and improvements


2010-10-06 | Zucker 8
* fix a little alias_for bug
* disable rdoc creation when installing (in favour of the custom docs)
* change Binding#inspect to Binding.variables (was too verbose and dangerous)


2010-10-03 | Zucker 7
* fix critical OS.windows? bug


2010-10-03 | Zucker 6
* no new cubes
* bugfix for OS.posix?
* small changes + bugfixes + doc improvements
* add two user methods to Info
* change egonil semantics ( using method_missing, see http://rbjl.net/26/catch_nil.rb )
* bugfix for vv


2010-09-04 | Zucker 5
* debug edition -  add two debug helpers: oo (output line, method, file) and cc (output method callstack)
* rename cube D to dd add add more debug aliases (for mm and binding)
* fix __SPECIAL_VARS__ in info and kernel cube and some minor bugfixes
* Zucker.activate_more_aliases! option
* add Hash#&
* add aliases: File.filename (for basename), Dir.join and Dir.split (for File.join, split)
* add a flexible requiring mechansim in zucker.rb (no api changes)
* restructure packages
* add rake tasks for releasing
* improve RubyVersion constant (cleaner and more flexible)


2010-09-01 | Zucker 4
* fix Binding#inspect
* add RubyEngine constant
* add RubyVersion constant
* add OS constant
* add q debug method (like p but on one line)
* add String#-


2010-08-14 | Zucker 3
* add tap cube
* add Object#not
* add alias_for for an alternative alias syntax
* add String#constantize (improved AS version)
* improve Info module
* make Array#sum Rails compatibile
* improve docs
* change directory layout (no changes for requiring)
* more small changes


2010-08-08 | Zucker 2
* add info cube
* add chaining for array2proc
* fix Hash.zip
* fix instance_variables_from binding for 1.9
* more specs


2010-08-06 | Zucker 1
* initial release


2010-08-05 | Zucker 0
* pre-release for rug-b talk

