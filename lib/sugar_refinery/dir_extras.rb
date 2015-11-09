require 'sugar_refinery'
require 'fileutils'

module SugarRefinery
  module DirExtras
    refine Dir.singleton_class do
      def join(*args)
        File.join(*args)
      end

      def split(*args)
        File.split(*args)
      end

      def rm(*args)
        FileUtils.rm_r(*args)
      end
    end
  end
end
