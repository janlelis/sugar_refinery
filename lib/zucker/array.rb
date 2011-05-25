require 'zucker'
module Zucker Array = true end

class Array
  def ^(other) # TODO: more efficient
    (self - other) +
    (other - self)
  end

  # can take an argument & block to be Rails compatible
  def sum(identity = 0, &block)
    # inject(:+)
    if block_given?
      map(&block).sum( identity )
    else
      inject(:+) || identity
    end
  end

  def chrs
    self.pack 'C*'
  end
end

# J-_-L

