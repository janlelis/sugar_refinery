require 'zucker'
module Zucker Mcopy = true end

class Object
  def mcopy
    Marshal.load Marshal.dump self
  end
end

# J-_-L

