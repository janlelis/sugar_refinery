require 'zucker/array2proc'

describe 'Array#to_proc' do
  it 'should call the method of the first symbol, using the remaining elements as paramaters' do
    [1,2,3,4].map( &[:to_s, 2] ).should == ["1", "10", "11", "100"]
  end
end

