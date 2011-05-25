require 'zucker'
module Zucker Ivars = true end

def instance_variables_from(obj, *only)
  iter =
  if    obj.is_a? Binding
    obj.eval('local_variables').map{|e| [obj.eval("#{e}"), e] }
  elsif obj.is_a? Hash
    obj.map{|k,v| [v,k] }
  else
#  elsif obj.is_a? Enumerable
    obj.each.with_index
  end

  ret = []
  iter.each{ |value, arg|
    arg = arg.to_s
    if only.include?(arg) || only.include?(arg.to_sym) || only.empty?
      arg = '_' + arg  if (48..57).member? arg.unpack('C')[0]  # 1.8+1.9
      ret << ivar = :"@#{arg}"
      self.instance_variable_set ivar, value
    end
  }
  ret
end
alias ivars instance_variables_from

# J-_-L

