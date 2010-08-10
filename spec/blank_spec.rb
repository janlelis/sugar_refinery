require 'zucker/blank'

describe 'Object#blank?' do
  it 'should be blank for blank values' do
    blank_values   = [ nil, false, '', '   ', "  \n\t  \r ", [], {}, // ]

    blank_values.each{ |blank|
      blank.blank?.should == true
    }
  end

  it 'should not be blank for non blank values' do
    present_values = [ Object.new, true, 0, 1, 'a', [nil], { nil => nil } ]

    present_values.each{ |present|
      present.blank?.should == false
    }
  end
end

