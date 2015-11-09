require "sugar_refinery/chain_map"
using SugarRefinery::ChainMap

describe "Array#chain_map" do
  it "should repeatedly chain symbols as map calls" do
    list = [-3, -2, -1]

    list.chain_map(:abs, :to_s) == %w{3 2 1}
  end

  it "should repeatedly chain blocks as map calls" do
    list = [-3, -2, -1]

    list.chain_map(->(e) { e ** 2 }, ->(e) { e * -1 }) == [-9, -4, -1]
  end
end
