require 'zucker/D'

describe 'Object#D' do

  let :a do
    [ 1, "1", 2..5, [], {:hallo => :du}, nil, true ]
  end

  it 'should not change the object"s value' do
    a.each{ |e|
      (e.D).should == e
    }
  end

  it "should puts .inspect if no block is given (and not change the object's value)" do
#    a.each{ |e|
#      (e.D).should == e
#    }
  end

  it "should puts the block if it is given (and not change the object's value)" do
    a.each{ |e|
      (e.D{|value| "This is a: #{value}"}).should == e
    }
  end
end

