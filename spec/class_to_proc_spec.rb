require 'zucker/class_to_proc'
require 'set'

describe 'Class#to_proc' do
  it 'should create new instances of the class' do
    [ [1,2],[3,5,6,7,3] ].map(&Set).should == [ Set[1,2], Set[5,6,7,3] ]
  end
end

