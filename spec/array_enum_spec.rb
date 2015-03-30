require "zucker/array_enum"
using Zucker::ArrayEnum

describe "Array#inner_map" do
  it "should delegate map to inner lists" do
    list = [[1, 2], [3, 4]]

    list.inner_map { |i| i + 1 }.should == [[2, 3], [4, 5]]
  end
end

describe "Array#inner_inject" do
  it "should delegate inject to inner lists" do
    list = [%w{a b c}, %w{d e f}]

    list.inner_inject(&:+).should == list.map(&:join)
  end

  it "should take default values" do
    list = [[3, 2, 1], [-4]]

    list.inner_inject(4, &:+).should == [10, 0]
  end
end
