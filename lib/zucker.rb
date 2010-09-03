# documentation at http://rubyzucker.info or doc/zucker_doc.html

module Zucker
  # version and date get modified by the :prepare_release rake task
  VERSION = '5'
  DATE = '2010-09-04'
  
  # cube list
  PACKAGES = {
    :control    => %w|egonil iterate tap sandbox kernel|,
    :env        => %w|engine info os version|,
    :extensions => %w|array enumerable hash string unary union|,
    :object     => %w|blank mcopy not|,
    :to_proc    => %w|array2proc class2proc hash2proc regexp2proc|,
    :shortcuts  => %w|aliases alias_for square_brackets_for ivars|,
    :debug      => %w|binding cc dd mm oo qq|,
  }

  NON_1_8_CUBES = %w|not tap union|

  class << self
    # Zucker require helpers
    def require_cube(cube, version = '')
      unless RUBY_VERSION < '1.9' && Zucker::NON_1_8_CUBES.include?(cube)
        require File.expand_path( File.join('..', 'zucker', version, cube), __FILE__)
      end
    end

    def require_package(package, version = '')
      PACKAGES[package.to_sym].each{ |cube|
        require_cube cube, version
      }
    end

    def require_this(filename)
      version=  File.split( File.expand_path( filename) )[-2]
      version = '' if version !~ /^\d+$/
      package = File.basename( filename ).chomp( File.extname( filename ))
      Zucker.require_package(package, version)
    end

    def require_all(version = '')
      require_default( version ) +
      [require_package( :debug, version )]
    end

    def require_default(version = '')
      PACKAGES.map{ |package, _|
        require_package package if package != :debug
      }.compact
    end

    # these aliases 'pollute' the global namespace or may conflict with other codee
    def activate_more_aliases!
      aliases = {
        :mcopy       => :copy,
        :egonil      => :n,
        :make_new    => :init,
        :tap_on      => :returning,
        :library?    => :lib?,
        :square_brackets_for => :brackets,
      }

      loaded_aliases = []
      aliases.each{ |old, new|
        Object.class_eval "alias #{new} #{old}; loaded_aliases << :#{new}" rescue nil
      }
      eval "::RV = RubyVersion; loaded_aliases << :RV" rescue nil
      eval "::RE = RubyEngine;  loaded_aliases << :RE" rescue nil
      
      loaded_aliases
    end
    alias more_aliases! activate_more_aliases!
  end
end

# You can use Zucker with
#  require 'zucker/all'

# J-_-L
