require 'zucker'
require 'rbconfig'
module Zucker Os = true end

module OS
  class << self
    def is?(what)
      what === RbConfig::CONFIG['host_os']
    end
    alias is is?

    def to_s
      RbConfig::CONFIG['host_os']
    end
  end

  module_function

  def linux?
    OS.is?( /linux|cygwin/ )
  end

  def mac?
    OS.is?( /mac|darwin/ )
  end

  def bsd?
    OS.is?( /bsd/ )
  end

  def windows?
    OS.is?( /mswin|mingw/ )
  end

  def solaris?
    OS.is?( /solaris|sunos/ )
  end

  def posix?
    linux? or mac? or bsd? or solaris? or begin 
        fork do end
        true
      rescue NotImplementedError, NoMethodError
        false
      end
  end

  #def symbian?
    #TODO who knows what symbian returns?
  #end

  # ...
end

# J-_-L
