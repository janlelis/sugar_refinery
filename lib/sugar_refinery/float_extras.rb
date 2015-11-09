require_relative 'version'

module SugarRefinery
  module FloatExtras
    refine Float do
      def same?(other)
        (self - other).abs < Float::EPSILON
      end
    end
  end
end
