require 'sugar_refinery'

module SugarRefinery
  module UnaryConversion
    refine String do
      def +@
        self
      end

      def -@
        to_sym
      end
    end

    refine Symbol do
      def +@
        to_s
      end

      def -@
        self
      end
    end
  end
end
