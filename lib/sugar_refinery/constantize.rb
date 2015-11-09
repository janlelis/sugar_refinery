require 'sugar_refinery'

module SugarRefinery
  module Constantize
    refine String do
      def constantize(default_value = nil) # always uses global scope as in AS... is this good?
        get_constant = lambda{
          self.split(/::/).inject( Object ){ |base_constant, current_constant|
            base_constant.const_get current_constant
          }
        }

        if !default_value && !block_given?
          get_constant.call
        else
          begin
            get_constant.call
          rescue NameError
            if block_given?
              yield self
            else
              default_value
            end
          end
        end
      end
    end
  end
end
