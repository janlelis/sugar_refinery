alias is_an? is_a?

module Enumerable
  alias with zip
  alias %    zip
end

class Array
  alias ** product
end

class Hash
  alias + merge
end

class Binding
  #alias [] eval
  def [](expr)
    self.eval "#{expr}"
  end
end

# constants - who would use these in real-world code for other things?
Infinity = 1.0 / 0.0 # or 2*Float::MAX
NaN      = 0.0 / 0.0

# J-_-L

