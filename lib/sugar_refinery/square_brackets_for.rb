require_relative 'version'

module SugarRefinery
  module SquareBracketsFor
    refine Object do
      def square_brackets_for(ivar, assignment = true)
        define_method :[] do |key|
          (instance_variable_get :"@#{ivar}")[key]
        end

        if assignment
          define_method :[]= do |key, value|
            (instance_variable_get :"@#{ivar}")[key] = value
          end
        end
      end
    end
  end
end
