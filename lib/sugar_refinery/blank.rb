require 'sugar_refinery'

module SugarRefinery
  module Blank
    refine Object do
      def blank?
        if respond_to? :empty? then empty? else !self end
      end

      def present?
        !blank?
      end
    end

    refine NilClass do
      def blank?() true end
    end

    refine FalseClass do
      def blank?() true end
    end

    refine TrueClass do
      def blank?() false end
    end

    refine Numeric do
      def blank?() false end
    end

    refine Array do
      def blank?() empty? end
    end

    refine Hash do
      def blank?() empty? end
    end

    refine String do
      def blank?() self !~ /\S/ end
    end

    refine Regexp do
      def blank?() self == // end
    end
  end
end
