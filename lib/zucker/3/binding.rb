require 'zucker'

class Binding
  def inspect
    put_vars = lambda { |array|
      if array.empty?
        ' - none'
      else
        array.map{|e| " - #{e}: #{ self.eval '#{e}'}"}*"\n"
      end
    }

"#{self.to_s}
local vars
#{ put_vars[ self.eval 'local_variables' ] }
(instance vars)
#{ put_vars[ self.eval 'instance_variables' ] }
self
 - #{self.eval 'self'}
block_given?
 - #{self.eval 'block_given?'}"

  end
end

# J-_-L

