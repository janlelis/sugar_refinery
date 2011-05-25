require 'zucker'
module Zucker Union = true end

class Regexp
  def |(arg)
    Regexp.union self, arg.is_a?(Regexp) ? arg : arg.to_s
  end
end

class String
  def |(arg)
    Regexp.union self, arg.is_a?(Regexp) ? arg : arg.to_s
  end
end

# J-_-L

