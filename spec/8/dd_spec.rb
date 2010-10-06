require 'zucker/dd'

describe 'Object#d' do

  let :a do
    [ 1, "1", 2..5, [], {:hallo => :du}, nil, true ]
  end

  it "should not change the object's value" do
    capture_stdout do
      a.each{ |e|
        (e.d).should == e
      }

      a.each{ |e|
        (e.d{|value| "This is a: #{value}"}).should == e
      }
    end
  end

  it "should puts .inspect if no block is given (and not change the object's value)" do
    capture_stdout do
      a[0].d
      a[1].d
      a[6].d
    end.should == %{1\n"1"\ntrue\n}
  end

  it "should puts the block if it is given (and not change the object's value)" do
    capture_stdout do
      a[0].d{|value| "This is a: #{value}"}
      a[1].d{|value| "This is a: #{value}"}
      a[6].d{|value| "This is a: #{value}"}
    end.should == %{This is a: 1\nThis is a: 1\nThis is a: true\n}
  end
end

