require 'zucker'

class Object
  def mcopy
    Marshal.load Marshal.dump self
  end
  # alias copy mcopy
end

# J-_-L

