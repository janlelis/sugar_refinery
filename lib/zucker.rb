require 'refine'


module Zucker
  VERSION = '100.0.0'
  DATE = '2014-04-01'

  class << self
    def require(cube)
      require_relative "zucker/#{cube}"
    end

    def require_all
      Dir[File.dirname(__FILE__) + '/zucker/*'].each{ |f| self.require File.basename(f) }
    end
  end
end
