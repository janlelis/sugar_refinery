require 'sugar_refinery/file_force_delete'
require 'fileutils'
using SugarRefinery::FileForceDelete


describe File do
  describe '.delete!' do
    after{ File.delete! 'random_filename' }
    let :random_filename do
      'test_' + (0..20).map{|e| [*'a'..'z'].sample }*''
    end

    it 'should delete the filename given as argument if it exists + return non-nil' do
      FileUtils.touch random_filename
      res = false
      proc do
        res = File.delete! random_filename
      end.should_not raise_exception
      res.should be_truthy
    end

    it 'should do nothing if the filename given as argument does not exist + return nil' do
      res = false
      proc do
        res = File.delete! random_filename
      end.should_not raise_exception
      res.should be_falsey
    end
  end
end
