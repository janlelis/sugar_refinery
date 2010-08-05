require 'aliases'

describe '(aliases)' do
  it 'should create these aliases [ sorry, no real spec for this one :P ] ' do
  # alias is_an? is_a?

  #  module Enumerable
  #    alias with zip
  #    alias %    zip
  #  end

  #  class Array
  #    alias ** product
  #  end

  #  class Hash
  #    alias + merge
  #  end

  #  class Binding
  #    #alias [] eval
  #    def [](expr)
  #      self.eval "#{expr}"
  #    end
  #  end

  end

  it 'should define these constants' do
    Infinity.finite?.should == false
    NaN.nan?.should         == true
  end
end

