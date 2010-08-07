class Array
  def ^(other) # TODO: more efficient
    (self - other) +
    (other - self)
  end

  def sum # sry, you just need this one too often
    inject :+
  end

  def chrs
    self.pack 'C*'
  end
end

# J-_-L

