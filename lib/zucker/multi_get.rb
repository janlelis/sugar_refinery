require "zucker"

module Zucker
  module MultiGet
    refine Array do
      def at_indexes(*list)
        list.flatten.map { |i| self[i] }
      end
      alias :at_indices :at_indexes
    end
  end
end
