class Array
  def ^(other) # TODO: more efficient
    (self - other) +
    (other - self)
  end

  if !respond_to?(:sum)
    def sum # sry, you just need this one too often
      inject :+
    end
  end

  def chrs
    self.pack 'C*'
  end
end

# J-_-L

