# documentation at http://rubyzucker.info or doc/zucker_doc.html

module Zucker
  # version and date get modified by the :prepare_release rake task
  VERSION = '4.next'
  DATE = '2010-09-01' # version 4
  
  # cube list
  PACKAGES = {
    :env        => %w|engine info os version|,
    :to_proc    => %w|array2proc class2proc regexp2proc hash2proc|,
    :object     => %w|blank not mcopy|,
    :debug      => %w|D mm binding q|,
    :extensions => %w|array hash string enumerable unary union|,
    :control    => %w|sandbox egonil iterate tap kernel|,
    :shortcuts  => %w|alias_for aliases square_brackets_for ivars|,
  }
end

# You can use Zucker with:
# require 'zucker/all'
