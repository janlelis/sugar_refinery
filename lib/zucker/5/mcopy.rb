require 'zucker'

class Object
  def mcopy
    Marshal.load Marshal.dump self
  end
end

# J-_-L

