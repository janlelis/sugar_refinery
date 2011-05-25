require 'zucker'
module Zucker AliasFor = true end

def alias_for(m, *aliases)
  aliases.each{ |a|
    class_eval "alias #{a} #{m}"
  }
end
alias aliases_for alias_for

class Module
  def alias_method_for(m, *alias_methods)
    alias_methods.each{ |a|
      class_eval do
        alias_method a.to_sym, m.to_sym
      end
    }
  end
  alias alias_methods_for alias_method_for
end

# J-_-L
