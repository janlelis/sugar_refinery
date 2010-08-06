require 'zucker/string'

describe 'String#^' do
  it 'should give C-like substring access to strings' do
    string = 'Theoretische Informatik ist voll geil!'

    (string^0).should  == 'Theoretische Informatik ist voll geil!'
    (string^1).should  == 'heoretische Informatik ist voll geil!'
    (string^13).should == 'Informatik ist voll geil!'
    (string^-1).should == 'Theoretische Informatik ist voll geil'
    (string^38).should == ''
    (string^99).should == nil
  end
end

describe 'String#lchomp' do
  it 'should chomp on the left side' do
    string = 'Theoretische Informatik ist voll geil!'
    string.lchomp('T').should  == 'heoretische Informatik ist voll geil!'
  end
end

describe 'String#ords' do
  it 'should unpack characters' do
    string = 'Theoretische Informatik ist voll geil!'
    string.ords.should  == [84, 104, 101, 111, 114, 101, 116, 105, 115, 99, 104, 101, 32, 73, 110, 102, 111, 114, 109, 97, 116, 105, 107, 32, 105, 115, 116, 32, 118, 111, 108, 108, 32, 103, 101, 105, 108, 33]
  end
end

