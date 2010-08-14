module Kernel
  def D(*args, &block)
    if args.empty?
      tap{
        if block_given?
          puts yield self
        else
          puts self.inspect
        end
      }
    else
      raise ArgumentError, ".D - The parser thought that the code after .D are method arguments... Please don't put a space after D or use .D() or .D{} in this case!"
#      eval ...
    end
  end
end

# J-_-L

