require 'zucker'
module Zucker ArrayToProc = true end

class Array
  def to_proc
    Proc.new{ |obj|
      if self.first.is_a? Array
        self.inject(obj){ |result, nested_array|
          nested_array.to_proc.call result
        }
      else
        obj.send(*self)
      end
    }
  end
end

# J-_-L

