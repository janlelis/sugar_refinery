require 'zucker/array'

describe 'Array#^' do
  it 'should do an exclusive or' do
    a = [1,2,3,4]
    b = [3,4,5,6]
    (a^b).should == [1,2,5,6]
  end
end

describe 'Array#sum' do
  it 'should sum the array' do
    [1,2,3,4,5].sum.should   == 15
    %w|More Ruby|.sum.should == 'MoreRuby'
  end
end

describe 'Array#chrs' do
  it 'should convert the array to a string, using each element as ord value for the char' do
    [72, 97, 108, 108, 111].chrs.should == 'Hallo'
  end
end

