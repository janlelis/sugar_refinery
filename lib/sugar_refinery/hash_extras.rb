require 'sugar_refinery'

module SugarRefinery
  module HashExtras
    refine Hash.singleton_class do
      def zip(keys, values)
        Hash[ *keys.zip(values).flatten ]
      end
    end
  end
end
