begin
  require 'refine'
rescue LoadError
end


module SugarRefinery
  VERSION = '1.0.0'
  DATE = '2016-01-01'

  class << self
    def require(cube)
      require_relative "sugar_refinery/#{cube}"
    end

    def require_all
      Dir[File.dirname(__FILE__) + '/sugar_refinery/*'].each{ |f| self.require File.basename(f) }
    end
  end
end
