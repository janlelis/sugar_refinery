require "zucker/multi_get"
using Zucker::MultiGet

describe "Array#mult_get" do
  it "should return values at given indices" do
    list = (?a..?e).to_a

    list.at_indexes(1, 3).should == %w{b d}
    list.at_indexes([1, 3]).should == %w{b d}
  end

  it "should work with at_indexes and at_indices" do
    list = (?a..?e).to_a

    list.at_indices(1, 3).should == list.at_indexes(1, 3)
  end
end
