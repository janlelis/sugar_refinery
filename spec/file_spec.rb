require 'zucker/file'
require 'fileutils'

describe 'File.gsub' do
  let :random_filename do
    'test_' + (0..20).map{|e| [*'a'..'z'].send RUBY_VERSION > '1.9' ? :sample : :choice }*''
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

describe 'File.delete!' do
  let :random_filename do
    'test_' + (0..20).map{|e| [*'a'..'z'].send RUBY_VERSION > '1.9' ? :sample : :choice }*''
  end

  it 'should delete the filename given as argument if it exists + return non-nil' do
    FileUtils.touch random_filename
    res = false
    proc do
      res = File.delete! random_filename
    end.should_not raise_exception
    res.should be_true
  end

  it 'should do nothing if the filename given as argument does not exist + return nil' do
    res = false
    proc do
      res = File.delete! random_filename
    end.should_not raise_exception
    res.should be_false
  end
end

