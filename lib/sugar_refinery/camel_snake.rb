require_relative 'version'

module SugarRefinery
  module CamelSnake
    refine String do
      def to_snake
        gsub(/(?<!^)[A-Z]/) do "_#$&" end.downcase
      end

      def to_camel
        gsub(/(?:^|_)([a-z])/) do $1.upcase end
      end
    end
  end
end
