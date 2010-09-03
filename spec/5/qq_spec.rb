require 'zucker/qq'

describe 'q' do

  it 'should output the same as p for a single arg' do
    capture_stdout{p /some object/}.should ==
    capture_stdout{q /some object/}
  end

  it "should output the same as p but for multiple args one one line, values separated by two spaces" do
    capture_stdout do
      q 1, "1", 2..5, [], {:hallo => :du}, nil, true
    end.chop.should ==
    capture_stdout do
      p 1, "1", 2..5, [], {:hallo => :du}, nil, true
    end.chop.gsub( "\n", '  ' )
  end
end

