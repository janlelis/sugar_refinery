require 'zucker'
module Zucker Enumerable = true end

module Enumerable
  def mash
    ret = {}
    each{ |kv|
      ret.store( *(yield(kv)[0,2]) )
    }
    ret
  end
end

# J-_-L

