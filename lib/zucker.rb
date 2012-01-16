# documentation at http://rubyzucker.info or doc/zucker_doc.html

module Zucker
  # version and date get modified by the :prepare_release rake task
  VERSION = '11'
  DATE = '2011-05-25'
  
  # cube list
  PACKS = {
    :control    => %w|egonil iterate tap sandbox kernel|,
    :env        => %w|engine info os ruby_version|,
    :extensions => %w|array enumerable file hash string unary union|,
    :object     => %w|blank mcopy not|,
    :to_proc    => %w|array_to_proc class_to_proc hash_to_proc regexp_to_proc|,
    :shortcuts  => %w|aliases alias_for square_brackets_for ivars|,
    :debug      => %w|binding cc dd mm oo qq regexp_visualize|,
  }

  NON_1_8_CUBES = %w|not|

  class << self
    # Zucker require helpers
    def require_cube(cube)
      unless RUBY_VERSION < '1.9' && Zucker::NON_1_8_CUBES.include?(cube)
        require "zucker/#{cube}"
      end
    end

    def require_package(package)
      PACKS[package.to_sym].each{ |cube|
        require_cube cube
      }
    end

    def require_this(filename)
      package = ::File.basename( filename ).chomp( ::File.extname( filename ))
      require_package(package)
    end

    def require_all
      require_default + [require_package( :debug )]
    end

    def require_default
      PACKS.map{ |package, _|
        require_package package if package != :debug
      }.compact
    end

    # these aliases 'pollute' the global namespace or may conflict with other code
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

      #eval "::RV = RubyVersion; loaded_aliases << :RV" rescue nil
      (
         Object.const_set 'RV', RubyVersion
         loaded_aliases << :RV
      ) rescue nil
      #eval "::RE = RubyEngine; loaded_aliases << :RE" rescue nil
      (
         Object.const_set 'RE', RubyEngine
         loaded_aliases << :RE
      ) rescue nil
      
      loaded_aliases
    end
    alias more_aliases! activate_more_aliases!
  end
end

# You can use Zucker with
#  require 'zucker/all'

# J-_-L
