require 'zucker'

class Binding
  def variables
    put_vars = lambda { |array|
      if array.empty?
        ' - none'
      else
        array.map{|e|
          val = (self.eval "#{e}").inspect
          " - #{e}: #{ val }"
        }.join "\n"
      end
    }

    puts "#{self.to_s}
local variables
#{ put_vars[ self.eval 'local_variables' ] }
(instance variables)
#{ put_vars[ self.eval 'instance_variables' ] }
self
 - #{self.eval 'self'}
block_given?
 - #{self.eval 'block_given?'}"

  end

  alias vars variables
end

# J-_-L

