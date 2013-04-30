require 'zucker'
module Zucker Array = true end

class Array
  def ^(other)
    (self - other) + (other - self)
  end

  def chrs
    self.pack 'C*'
  end
end

# J-_-L

