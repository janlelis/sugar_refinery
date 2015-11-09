require_relative 'version'

module SugarRefinery
  module RegexpUnion
    refine Regexp do
      def |(arg)
        Regexp.union self, arg.is_a?(Regexp) ? arg : arg.to_s
      end
    end

    refine String do
      def |(arg)
        Regexp.union self, arg.is_a?(Regexp) ? arg : arg.to_s
      end
    end
  end
end
