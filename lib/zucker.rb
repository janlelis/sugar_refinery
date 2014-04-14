begin
  require 'refine'
rescue LoadError
  if RUBY_VERSION < '2.0'
    warn "The zucker library depends on refinements, please install the refine gem, when running a RubyVersion < 2.0"
  end
end

module Zucker
  VERSION = '100.0.0'
  DATE = '2014-04-01'

  class << self
    def require(cube)
      require_relative "zucker/#{cube}"
    end

    def require_all
      Dir[File.join(File.dirname(__FILE__), "zucker", "*.rb")].each do |cube|
        autoload(File.basename(cube, ".rb").split(?_).map(&:capitalize).join.to_sym, cube)
      end and true
    end
  end
end
