require 'zucker'

module Zucker
  module StringExtras
    refine String do
      def lchomp(arg = $/)
        reverse.chomp(arg).reverse
      end

      def lchomp!(arg = $/)
        replace reverse.chomp(arg).reverse
      end
    end
  end
end
