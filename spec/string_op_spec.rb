require 'zucker/string_op'
using Zucker::StringOp


describe 'String#-' do
  it 'should remove the applied Regexp or String from self via gsub' do
    ('1234abc5678' - 'b' - /\d/).should == 'ac'
  end
end

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
