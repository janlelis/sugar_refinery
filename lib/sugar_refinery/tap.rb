require_relative 'version'

module SugarRefinery
  module Tap
    refine Object do
      private

      def tap_on(obj, &block)
        obj.tap(&block)
      end

      def make_new(what, *args, &block)
        what.new(*args).tap(&block)
      end
    end
  end
end
