require 'zucker'

module Zucker
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
