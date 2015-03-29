require 'zucker/file_extras'
require 'fileutils'
using Zucker::FileExtras


describe File do
  describe '.filename' do
    it 'behaves like basename' do
      File.filename('some/path/file.png').should == 'file.png'
    end
  end

  describe '.gsub' do
    after{ File.delete! 'random_filename' }
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
