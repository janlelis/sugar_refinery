require 'sugar_refinery/array_op'
using SugarRefinery::ArrayOp


describe 'Array#^' do
  it 'does an exclusive or' do
    a = [1,2,3,4]
    b = [3,4,5,6]
    (a^b).should == [1,2,5,6]
  end
end

describe 'Array#**' do
  it 'returns the array product' do
    ([1,2] ** %w[a b]).should == [[1, "a"], [1, "b"], [2, "a"], [2, "b"]]
  end
end
