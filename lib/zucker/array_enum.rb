require "zucker"

module Zucker
  module ArrayEnum
    refine Array do
      def inner_map(&block)
        map { |object| object.map(&block) }
      end

      def inner_inject(default = :not_used, &block)
        map { |object| default == :not_used ? object.inject(&block) : object.inject(default, &block) }
      end
    end
  end
end
