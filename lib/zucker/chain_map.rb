require "zucker"

module Zucker
  module ChainMap
    refine Array do
      def chain_map(*args)
        args.inject(self) { |collection, action| collection.map(&action) }
      end
    end
  end
end
