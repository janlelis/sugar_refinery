module Kernel
  def method_list(levels = 1)
    if self.is_a? Module
      klass, method_function = self, :public_methods
    else
      klass, method_function = self.class, :public_instance_methods

      eigen = self.singleton_methods
      if !eigen.empty?
        puts :Eigenclass # sorry for not being up to date, I just love the word
        p self.singleton_methods
      end
    end

    levels.times{ |level|
      if cur = klass.ancestors[level]
        p cur                               # put class name
        p cur.send method_function, false   # put methods of the class
      else
        break
      end
    }

    self # or whatever
  end

  alias mm method_list
end

# J-_-L

