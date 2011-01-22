require 'zucker/array_to_proc'

describe 'Array#to_proc' do
  it 'should call the method of the first symbol, using the remaining elements as paramaters' do
    [1,2,3,4].map( &[:to_s, 2] ).should == ["1", "10", "11", "100"]
  end

  it "should convert each element to a proc and chain it, if the first parameter is an array" do
    [1,2,3,4].map( &[[:*,2],[:+,4]] ).should == [1,2,3,4].map{|i| i*2 + 4 }
  end
end

