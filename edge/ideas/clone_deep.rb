class Object
  def clone_deep
    case self.class
    when Array
      self.map &:clone_deep
    else
      self.clone
    end
  end
  alias :dclone :clone_deep

  def dup_deep
    if self.is_a? Array
      self.map &:dup_deep
    else
      self.dup
    end
  end
  alias :ddup :dup_deep
end

