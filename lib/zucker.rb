begin
  require 'refine'
rescue LoadError
  if RUBY_VERSION < '2.0'
    warn "The zucker library depends on refinements, please install the refine gem, when running a RubyVersion < 2.0"
  end
end

module Zucker
  # version and date get modified by the :prepare_release rake task
  VERSION = '13.1'
  DATE = '2013-04-30'

  class << self
    def require(cube)
      require_relative "zucker/#{cube}"
    end

    def require_all
      Dir[File.dirname(__FILE__) + '/zucker/*'].each{ |f| self.require File.basename(f) }
    end
  end
end
