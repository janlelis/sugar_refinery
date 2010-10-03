require 'zucker'

module Kernel
  private

  def c(show_irb = false)
    method_stack = caller.reverse.map{ |m|
      m.rindex( /:\d+(:in `(.*)')?$/ )
      $2
    }.compact
    
    if !show_irb && a = method_stack.index( 'irb_binding' )
      method_stack = [ method_stack[0], '(irb)', *method_stack[a+1..-1] ]
    end

    # puts method_stack.map.with_index{ |m, i|
    method_stack.each_with_index{ |m, i|
      puts "  "*i + m
    }
  end

  alias cc c
end

# J-_-L
