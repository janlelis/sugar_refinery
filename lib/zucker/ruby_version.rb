=begin
# examples with 1.8.7
RubyVersion         # => 1.8.7

# check for the major version
RubyVersion.is? 1.8 # => true
RubyVersion.is? 1.9 # => false

# use strings for exacter checking
RubyVersion.is.above '1.8.7'    # => false
RubyVersion.is.at_least '1.8.7' # => true
RubyVersion.is.exactly '1.8.7'  # => true

# you can also use the common comparison operators
RubyVersion.is > '1.8.7'                 # => false
RubyVersion.is <= '1.8.7'                # => true
RubyVersion.is.between? '1.8.6', '1.8.7' # => true

# you can also throw an exception, if executed with the wrong Ruby version
RubyVersion.must_be.at_most '1.8.7'
RubyVersion.must_be 1.9 # raises NotImplementedError

# checks for the relase date are also possible
RubyVersion.is.older_than Date.today   # => true
RubyVersion.is.newer_than '2009-08-19' # => true

# and last but not least, some accessors
RubyVersion.major # => 1
RubyVersion.minor # => 8
RubyVersion.tiny  # => 7
RubyVersion.patchlevel # e.g. => 249
RubyVersion.description # e.g. => "ruby 1.8.7 (2010-01-10 patchlevel 249) [i486-linux]"

=end

module RubyVersion
  class << self

    def to_s
      RUBY_VERSION
    end

    def is(other_version = nil)
      if !other_version
        matcher
      else
        raise "RubyVersion check: Please use either a comparison operator or pass a Float" unless other_version.is_a? Float
        other_version == RUBY_VERSION.to_f
      end
    end
    alias is? is

    def must_be(other_version = nil)
      unless is? other_version
        fail NotImplementedError, "Sorry, this script requires Ruby #{other_version}, but was executed with a different Ruby version!"
      end
      true
    end
    alias must_be! must_be

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

    def matcher
      return @ruby if @ruby

      @ruby = RUBY_VERSION.dup
      @ruby.instance_eval do
        alias beneath   <
        alias beneath?  <
        alias at_most   <=
        alias at_most?  <=
        alias above     >
        alias above?    <=
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
