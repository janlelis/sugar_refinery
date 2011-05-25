require 'zucker'
module Zucker Cc = true end

module Kernel
  private

  def c(show_irb = false)
    method_stack = caller.reverse.map{ |m|
      m.rindex( /:\d+(:in `(.*)')?$/ )
      $2
    }.compact
    
    if !show_irb
      if a = method_stack.index( 'irb_binding' )
        method_stack = [ method_stack[0], '(irb)', *method_stack[a+1..-1] ]
      elsif a = method_stack[1..-1].index( '<main>' )
        method_stack = [ method_stack[0], '(ripl)', *method_stack[a+2..-1] ]
      end
    end

    # puts method_stack.map.with_index{ |m, i|
    method_stack.each_with_index{ |m, i|
      puts "  "*i + m
    }
    nil
  end

  alias cc c
end

# J-_-L
