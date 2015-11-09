require 'sugar_refinery'

module SugarRefinery
  module HashOp
    refine Hash do
      def <<(other)
        case
        when other.is_a?(Hash)
          merge! other
        when other.is_a?(Enumerable) || other.respond_to?(:to_splat)
          merge! Hash[*other]
        else
          raise TypeError, 'can only append other Hashs and Enumerables (or Classes that implement to_splat)'
        end
      end

      def &(other)
        Hash[ *select{ |k,v|
          other[k] == v
        }.flatten ]
      end

      def +(*o, &block)
        merge *o, &block
      end
    end
  end
end
