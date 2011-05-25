require 'zucker'
module Zucker Iterate = true end

def iterate(*params)
  # params.shift.zip(*params).each{ |*elements| yield *elements }
  raise ArgumentError, "wrong number of arguments (0)" if params.empty?

  first = params.shift
  if params.empty? # single param - like each
    if block_given?
      first.map{|e| yield e }
    else
      first.map.to_enum
    end
  else # multiple params
    max_size = [first, *params].max_by(&:count).size
    padded_first = first.to_a + [nil]*(max_size - first.count)  # append nils
    obj = padded_first.zip(*params)
    if block_given?
      obj.map{|es| yield(*es) }
    else
      obj.map.to_enum
    end
  end
end

# J-_-L

