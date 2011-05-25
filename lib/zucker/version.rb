require 'zucker'
require 'date'
require 'time'
module Zucker Version = true end

module RubyVersion
  class << self
    def to_s
      RUBY_VERSION
    end

    # comparable
    def <=>(other)
      value = case other
        when Integer
          RUBY_VERSION.to_i
        when Float
          RUBY_VERSION.to_f
        when String
          RUBY_VERSION
        when Date, Time
          other.class.parse(RUBY_RELEASE_DATE)
        else
          other = other.to_s
          RUBY_VERSION
        end
      value <=> other
    end
    include Comparable

    # chaining for dsl-like language
    def is?(other = nil)
      if other
        RubyVersion == other
      else
        RubyVersion
      end
    end
    alias is is?

    # aliases
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

    # compare dates
    def newer_than(other)
      if other.is_a? Date or other.is_a? Time
        RubyVersion > other
      else
        RUBY_RELEASE_DATE > other.to_s
      end
    end
    alias newer_than? newer_than

    def older_than(other)
      if other.is_a? Date or other.is_a? Time
        RubyVersion < other
      else
        RUBY_RELEASE_DATE < other.to_s
      end
    end
    alias older_than? older_than

    def released_today
      RubyVersion.date == Date.today
    end
    alias released_today? released_today

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
  end
end

# J-_-L
