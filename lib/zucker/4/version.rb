require 'zucker'

module RubyVersion
  class << self
    def to_s
      RUBY_VERSION
    end

    def is?(other_version = nil)
      compare other_version
    end
    alias is is?

    # accessors

    def major
      RUBY_VERSION.to_i
    end
    alias main major

    def minor
      RUBY_VERSION.split('.')[1].to_i
    end
    alias mini minor

    def tiny
      RUBY_VERSION.split('.')[2].to_i
    end
    alias teeny tiny

    def patchlevel
      RUBY_PATCHLEVEL
    end

    def platform
      RUBY_PLATFORM
    end

    def release_date
      Date.parse RUBY_RELEASE_DATE
    end
    alias date release_date

    def description
      RUBY_DESCRIPTION
    end

  private

    def compare(other_version)
      case other_version
      when nil
        matcher
      when Float
        other_version == RUBY_VERSION.to_f
      else
        other_version.to_s == RUBY_VERSION
      end
    end


    def matcher
      return @ruby if @ruby

      @ruby = RUBY_VERSION.dup
      @ruby.instance_eval do
        alias below     <
        alias below?    <
        alias at_most   <=
        alias at_most?  <=
        alias above     >
        alias above?    >
        alias at_least  >=
        alias at_least? >=
        alias exactly   ==
        alias exactly?  ==
        def not(other)
          self != other
        end
        alias not?     not
        alias between between?

        def newer_than(other)
          case other.class
          when Date, Time
            other.class.parse(RUBY_RELEASE_DATE) > other
          else
            RUBY_RELEASE_DATE > other.to_s
          end
        end
        alias newer_than? newer_than

        def older_than(other)
          case other.class
          when Date, Time
            other.class.parse(RUBY_RELEASE_DATE) < other
          else
            RUBY_RELEASE_DATE < other.to_s
          end
        end
        alias older_than? older_than

        def released_today
          RubyVersion.date == Date.today
        end
        alias released_today? released_today
      end

      @ruby.freeze
    end

  end
end

# J-_-L
