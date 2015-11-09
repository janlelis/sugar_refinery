require 'sugar_refinery'

module SugarRefinery
  module Mash
    refine Enumerator do
      def mash
        ret = {}
        each{ |kv| ret.store( *(yield(kv)[0,2]) ) }
        ret
      end
    end

    refine Array do
      def mash
        ret = {}
        each{ |kv| ret.store( *(yield(kv)[0,2]) ) }
        ret
      end
    end
  end
end

