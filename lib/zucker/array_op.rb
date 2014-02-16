require 'zucker'

module Zucker
  module ArrayOp
    refine Array do
      def ^(other)
        (self - other) + (other - self)
      end

      alias ** product
    end
  end
end
