require 'zucker'

class Class
  def to_proc
    Proc.new do |*args|
      self.new *args
    end
  end
end

# J-_-L

