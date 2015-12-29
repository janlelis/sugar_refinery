require_relative 'version'

module SugarRefinery
  module FileForceDelete
    refine File.singleton_class do
      def delete!(filename)
        return nil if !File.exist?(filename)
        File.delete filename
      end
    end
  end
end
