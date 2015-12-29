require 'sugar_refinery/file_gsub'
require 'fileutils'
using SugarRefinery::FileGsub


describe File do
  describe '.gsub' do
    let :random_filename do
      'test_' + (0..20).map{|e| [*'a'..'z'].sample }*''
    end

    it 'should read filename in arg1, substitute every key in the arg2 with its value and save the file' do
      File.open(random_filename,'w'){ |file|
        file.print 'should read filename in arg1, substitute every key in the arg2 with its value and save the file'
      }
      File.gsub random_filename,
        /read/ => 'write',
        /\d+/  => proc{|m| (m.to_i+1).to_s }

      File.read(random_filename).should ==
        'should write filename in arg2, substitute every key in the arg3 with its value and save the file'

      FileUtils.rm random_filename
    end
  end
end
