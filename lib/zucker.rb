module Zucker
  # version and date get modified by the :prepare_release rake task
  VERSION = '13.1'
  DATE = '2013-04-30'
  
  PACKS = {
    :control    => %w|egonil iterate tap sandbox kernel|,
    :env        => %w|engine info os ruby_version|,
    :extensions => %w|array case enumerable file hash string unary union|,
    :object     => %w|blank mcopy not|,
    :to_proc    => %w|array_to_proc class_to_proc hash_to_proc regexp_to_proc|,
    :shortcuts  => %w|aliases alias_for square_brackets_for ivars|,
    :debug      => %w|binding cc dd mm oo qq regexp_visualize|,
  }

  class << self
    # Zucker require helpers
    def require_cube(cube)
      require "zucker/#{cube}"
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
