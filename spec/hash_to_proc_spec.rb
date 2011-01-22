require 'zucker/hash_to_proc'

describe 'Hash#to_proc' do
  it 'should run the proc given in the value for a key in the hash' do
    [1,2,3,4].map(&{
      4 => :to_s,
      # 3 => [:to_s, 2]  # "11" =>  if array2proc is used
      2 => lambda {|e| e + 1000}
    }).should == [1, 1002, 3, "4"]
  end
end

