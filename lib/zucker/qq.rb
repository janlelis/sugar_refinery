require 'zucker'
module Zucker Qq = true end

module Kernel
  private

  def q(*args)
    puts args.map( &:inspect )*'  ' unless args.empty?
  end
  alias qq q
end

# J-_-L
