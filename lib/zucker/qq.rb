require 'zucker'

module Kernel
  def q(*args)
    puts args.map( &:inspect )*'  ' unless args.empty?
  end
  alias qq q
end

# J-_-L
