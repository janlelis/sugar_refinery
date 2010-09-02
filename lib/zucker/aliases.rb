alias is_an? is_a?

module Enumerable
  alias with zip
  alias %    zip
end

class Array
  alias ** product
  alias contains? include?
end

class String
  alias contains? include?
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

class << File
  alias filename basename
end

class << Dir
  def join(*args)
    File.join(*args)
  end

  def split(*args)
    File.split(*args)
  end
end

# constants - who would use these in real-world code for other things?
Infinity = 1.0 / 0.0 # or 2*Float::MAX or Float::INFINITY
NaN      = 0.0 / 0.0

# J-_-L

