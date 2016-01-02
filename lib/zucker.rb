begin
  require 'refine'
rescue LoadError
end


module Zucker
  VERSION = '100.2.0'
  DATE = '2016-01-03'

  warn "The zucker gem has been deprecated. Please use the sugar_refinery gem instead!"

  class << self
    def require(cube)
      require_relative "zucker/#{cube}"
    end

    def require_all
      Dir[File.dirname(__FILE__) + '/zucker/*'].each{ |f| self.require File.basename(f) }
    end
  end
end
