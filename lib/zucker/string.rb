require 'zucker'
module Zucker String = true end

class String
  def -(rem)
    gsub( Regexp === rem ? rem : rem.to_s, '' )
  end

  def ^(pos)
    pos = pos.to_i
    if pos >= 0
      self[pos..-1]
    else
      self[0...pos]
    end
  end

  def lchomp(arg = $/)
    reverse.chomp(arg).reverse
  end

  def lchomp!(arg = $/)
    reverse.chomp!(arg).reverse
  end

  def ords
    unpack 'C*'
   # bytes.to_a
  end

  def constantize(default_value = nil) # always uses global scope as in AS... is this good?
    get_constant = lambda{
      self.split(/::/).inject( Object ){ |base_constant, current_constant|
        base_constant.const_get current_constant
      }      
    }

    if !default_value && !block_given?
      get_constant.call
    else
      begin
        get_constant.call
      rescue NameError
        if block_given?
          yield self
        else
          default_value
        end
      end
    end
  end
end

# J-_-L

