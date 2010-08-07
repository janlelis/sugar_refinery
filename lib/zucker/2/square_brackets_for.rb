def square_brackets_for(ivar, assignment = true)
#  undef []   if respond_to? :[]
#  undef []=  if respond_to? :[]=

#instance_eval do
  define_method :[] do |key|
    (instance_variable_get :"@#{ivar}")[key]
  end

  if assignment
    define_method :[]= do |key, value|
      (instance_variable_get :"@#{ivar}")[key] = value
    end
  end
#end

end

# J-_-L

