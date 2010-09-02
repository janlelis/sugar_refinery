require 'zucker/hash'

describe 'Hash.zip' do
  it 'should zip together both given enumerables and take them as key=>values for a new hash' do
    Hash.zip( [1,2,3], [4,5,6] ).should == { 1=>4, 2=>5, 3=>6 }
  end
end

describe 'Hash#<<' do
  it 'should append new elements to the hash' do
    a =  { 1=>4, 2=>5, 3=>6 }
    a << { 4=>7 }
    a << [5, 8]
    a.should == { 1=>4, 2=>5, 3=>6, 4=>7, 5=>8 }
  end
end

describe 'Hash#&' do
  it 'should select a sub hash containt only equal key-value pairs' do
    a =  { 1=>4, 2=>5, 3=>6 }
    b=   { 1=>4, 2=>7 }
    (a & b).should == { 1=>4 }
  end
end

