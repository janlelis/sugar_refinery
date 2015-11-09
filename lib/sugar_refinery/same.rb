require_relative 'version'

module SugarRefinery
  module Same
    refine Float do
      def same?(other)
        (self - other).abs < Float::EPSILON
      end
    end
  end
end
