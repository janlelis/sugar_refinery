class String
  def ^(pos)
    pos = pos.to_i
    if pos >= 0
      self[pos..-1]
    else
      self[0...pos]
    end
  end

  def lchomp(arg = $/)
    self.reverse.chomp(arg).reverse
  end

  def lchomp!(arg = $/)
    self.reverse.chomp!(arg).reverse
  end

  def ords
    self.unpack 'C*'
  end

  def constantize(default_value = nil)
    if !default_value && !block_given?
      Object.const_get(self)
    else
      begin
        Object.const_get(self)
      rescue NameError
        if block_given?
          yield self
        else
          default_value
        end
      end
    end
  end

end

# J-_-L

