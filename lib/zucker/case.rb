require 'zucker'
module Zucker Case = true end

class String
  def to_snake
    gsub(/(?<!^)[A-Z]/) do "_#$&" end.downcase
  end
  
  def to_camel
    gsub(/(?:^|_)([a-z])/) do $1.upcase end
  end
end

# J-_-L
