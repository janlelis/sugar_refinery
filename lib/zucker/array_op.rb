require 'zucker'

module Zucker
  module ArrayOp
    refine Array do
      def ^(other)
        (self - other) + (other - self)
      end

      def **(*o, &block)
        product *o, &block
      end

      def sum
        self.inject(0, &:+)
      end
    end
  end
end
