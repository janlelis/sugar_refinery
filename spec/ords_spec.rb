require 'zucker/ords'
using Zucker::Ords


describe 'Array#chrs' do
  it 'converts the array to a string, using each element as ord value for the char' do
    [72, 97, 108, 108, 111].chrs.should == 'Hallo'
  end
end

describe 'String#ords' do
  it 'unpacks characters' do
    'Hallo'.ords.should == [72, 97, 108, 108, 111]
  end
end