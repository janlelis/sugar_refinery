require_relative 'version'
require 'fileutils'

module SugarRefinery
  module DirUtils
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
