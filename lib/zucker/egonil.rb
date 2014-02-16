require 'zucker'

module Zucker
  module Egonil
    refine Object do
      private

      def egonil(&block)
        mm = NilClass.instance_method(:method_missing)
        NilClass.send :define_method, :method_missing, ->(*){}
        yield
      ensure
        NilClass.send :define_method, :method_missing, mm
      end
    end
  end
end