require_relative 'version'

module SugarRefinery
  module Lchomp
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
