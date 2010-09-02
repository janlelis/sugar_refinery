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

  # Zucker require helpers
  def self.require_cube(cube, version = '')
    require File.expand_path( File.join('..', 'zucker', version, cube), __FILE__)
  end

  def self.require_package(package, version = '')
    PACKAGES[package.to_sym].each{ |cube_name|
      require_cube cube_name, version
    }
  end

  def self.require_this(filename)
    version=  File.split( File.expand_path( filename) )[-2]
    version = '' if version =~ /^\d+$/
    Zucker.require_package( File.basename( filename ).chomp( File.extname( filename )), version)
  end
end

# You can use Zucker with
#  require 'zucker/all'

# J-_-L
