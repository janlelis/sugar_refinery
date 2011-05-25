require 'zucker'
module Zucker Unary = true end

class String
  def +@
    self
  end

  def -@
    to_sym
  end
end

class Symbol
  def +@
    to_s
  end

  def -@
    self
  end
end

# J-_-L

