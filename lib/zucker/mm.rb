require 'zucker'
module Zucker Mm = true end

module Kernel
  def m(levels = 1)
    # output helper
    mputs = proc{ |e| puts e.map(&:to_s)*'  ' }

    # how to get results
    if self.is_a? Module
      klass, method_function = self, :public_methods
    else
      klass, method_function = self.class, :public_instance_methods
    end

    # eigenclass
    eigen = self.singleton_methods
    if !eigen.empty?
      puts '= Eigenclass' # sorry for not being up to date, I just love the word
      mputs[ self.singleton_methods ]
    end

    # display
    levels.times{ |level|
      if cur = klass.ancestors[level]
        puts "= #{cur}"  # put class name
        mputs[ cur.send method_function, false ] # put methods of the class
      else
        break
      end
    }

    nil
  end

  alias mm          m
  alias method_list m
end

# J-_-L

