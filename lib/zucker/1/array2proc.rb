require 'zucker'

class Array
  def to_proc
    Proc.new{ |obj|
      obj.send *self
    }
  end
end

# J-_-L

