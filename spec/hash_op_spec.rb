require 'sugar_refinery/hash_op'
using SugarRefinery::HashOp


describe 'Hash#<<' do
  it 'appends new elements to the hash' do
    a =  { 1=>4, 2=>5, 3=>6 }
    a << { 4=>7 }
    a << [5, 8]
    a.should == { 1=>4, 2=>5, 3=>6, 4=>7, 5=>8 }
  end
end

describe 'Hash#&' do
  it 'selects a sub hash containt only equal key-value pairs' do
    a = { 1=>4, 2=>5, 3=>6 }
    b = { 1=>4, 2=>7 }
    (a & b).should == { 1=>4 }
  end
end

describe 'Hash#+' do
  it 'merges two hashes' do
    a = { 1=>4, 2=>5, 3=>6 }
    b = { 1=>4, 2=>7, 4=>0 }
    (a + b).should == { 1=>4, 2=>7, 3=>6, 4=>0 }
  end
end
