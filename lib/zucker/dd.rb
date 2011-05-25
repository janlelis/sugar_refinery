require 'zucker'
module Zucker Dd = true end

module Kernel
  def d(*args, &block)
    if args.empty?
      tap{
        if block_given?
          puts yield self
        else
          puts self.inspect
        end
      }
    else
      raise ArgumentError, ".d - The parser thought that the code after .d are method arguments... Please don't put a space after d or use .d() or .d{} in this case!"
#      eval ...
    end
  end

  alias dd d
end

# J-_-L

