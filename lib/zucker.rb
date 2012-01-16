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

    def require_pack(pack)
      PACKS[pack.to_sym].each{ |cube|
        require_cube cube
      }
    end

    def require_this(filename) # pack shortcut
      pack = ::File.basename( filename ).chomp( ::File.extname( filename ))
      require_pack(pack)
    end

    def require_default
      PACKS.map{ |pack, _|
        require_pack pack if pack != :debug
      }.compact
    end

    def require_all
      require_default + [require_pack( :debug )]
    end
  end
end

# J-_-L
