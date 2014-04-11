require "zucker"

module Zucker
  module Itself
    refine Object do
      def itself
        self
      end
    end
  end
end
