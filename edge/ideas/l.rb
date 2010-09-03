require 'zucker'

module Kernel
  def l(*args)
    debug_info = caller[0]

    case args.size
    when 0
      puts debug_info
    when 1
      puts "#{args[0].inspect}  in #{debug_info}"
    else
      puts debug_info, args.map{ |arg| arg.inspect }
    end

    nil 
  end 
end

# J-_-L
