require 'zucker/aliases'

describe '(aliases)' do
  it 'should create these aliases' do
    # see aliases.rb for aliase list
  end

  it 'should define these constants' do
    Infinity.finite?.should == false
    NaN.nan?.should         == true
  end
end

