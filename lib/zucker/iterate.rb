require 'zucker'

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
  else
    padded_first = Array.new( [first, *params].max_by{|e|e.to_a.size}.size ){|i| first[i] } # append nils
    obj = padded_first.zip *params
    if block_given?
      obj.map{|es| yield *es }
    else
      obj.map.to_enum
    end
  end
end

# J-_-L

