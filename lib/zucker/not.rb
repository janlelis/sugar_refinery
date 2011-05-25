require 'zucker'
module Zucker Not = true end

class Object
  def not
    NotClass.new self
  end

  class NotClass < BasicObject
    def initialize(receiver)
      @receiver = receiver
    end
    
    def method_missing(m, *args, &block)
      not @receiver.public_send( m, *args, &block )
    end
  end
end

# J-_-L
