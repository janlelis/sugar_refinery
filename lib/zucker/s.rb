require 'zucker'

module Kernel
  def s(show_irb = false)
    method_stack = caller.reverse.map{ |m|
      m.rindex( /:\d+(:in `(.*)')?$/ )
      $2
    }.compact
    
    if !show_irb && a = method_stack.index( 'irb_binding' )
      method_stack = [ method_stack[0], '(irb)', *method_stack[a+1..-1] ]
    end

    puts method_stack.map.with_index{ |m, i|
      "  "*i + m
    }
  end
  alias callstack s
end

# J-_-L
