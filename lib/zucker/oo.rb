require 'zucker'
module Zucker Oo = true end

module Kernel
  private

  def o(desc = nil)
    caller[0].rindex( /:(\d+)(:in (`.*'))?$/ )
    m = $3 ? "method #$3, " : ""
    d = desc ? "#{desc}: r" : 'R'

    puts "#{d}eached #{m}line #$1 of file #$`"
    # [$`, $1.to_i, $3.to_sym,  desc]
  end 
  alias oo o
end

# J-_-L
