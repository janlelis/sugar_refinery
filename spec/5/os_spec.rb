require 'zucker/os'

describe 'OS' do
  it 'should display the used operation system (to_s)' do; end
end

describe 'linux?' do
  it 'should return true if OS is a linux' do; end
end

describe 'mac?' do
  it 'should return true if OS is a mac or darwin' do; end
end

describe 'bsd?' do
  it 'should return true if OS is a bsd' do; end
end

describe 'windows?' do
  it 'should return true if OS is a windows' do; end
end

describe 'solaris?' do
  it 'should return true if OS is a solaris or sunos' do; end
end

describe 'posix?' do
  it 'should return true if OS is posix compatible' do; end
end

describe 'OS.is?' do
  it "should test if RbConfig::CONFIG['host_os'] matches the regex (boolean value)" do
    OS.is?(/linux/).should ==
    !!( RbConfig::CONFIG['host_os'] =~ /linux/ )
  end
end

