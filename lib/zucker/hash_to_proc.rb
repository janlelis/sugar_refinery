require 'zucker'
module Zucker HashToProc = true end

class Hash
  def to_proc
    Proc.new{ |obj|
      if self.member? obj
        self[obj].to_proc.call obj
      else
        obj
      end
    }
  end
end

# J-_-L

