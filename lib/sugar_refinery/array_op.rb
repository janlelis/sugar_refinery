require_relative 'version'

module SugarRefinery
  module ArrayOp
    refine Array do
      def ^(other)
        (self - other) + (other - self)
      end

      def **(*o, &block)
        product *o, &block
      end
    end
  end
end
