class String
  def ^(pos)
    pos = pos.to_i
    if pos >= 0
      self[pos..-1]
    else
      self[0...pos]
    end
  end

  def lchomp(arg=$/)
    self.reverse.chomp(arg).reverse
  end

  def lchomp!(arg=$/)
    self.reverse.chomp!(arg).reverse
  end

  def ords
    self.unpack 'C*'
  end
end

# J-_-L

