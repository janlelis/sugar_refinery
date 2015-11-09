require "sugar_refinery"

module SugarRefinery
  module InnerMap
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
