require_relative 'version'

module SugarRefinery
  module HashZip
    refine Hash.singleton_class do
      def zip(keys, values)
        Hash[ *keys.zip(values).flatten ]
      end
    end
  end
end
