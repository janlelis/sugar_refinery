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

describe 'String#palindrome?' do
  it 'should return true if the string is a palindrome' do
    palindrome_string = 'Noon'
    non_palindrome_string = 'whatever'
    palindrome_string_with_spaces = 'Now I won'

    expect(palindrome_string.palindrome?).to be true
    expect(non_palindrome_string.palindrome?).to be false
    expect(palindrome_string_with_spaces.palindrome?).to be true
  end
end
