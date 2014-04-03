require 'zucker/array_op'
using Zucker::ArrayOp


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

describe 'Array#sum' do
  it "returns the sum of the array" do
    expect([1,2].sum).to eql 3
    expect([1.5,2.5].sum).to eql 4.0
  end
end
