module Kernel
  def q(*args)
    puts args.map( &:inspect ).join '  '
  end
end
