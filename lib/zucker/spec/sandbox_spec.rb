require 'zucker/sandbox'

describe 'sandbox' do
  it 'should throw a SecurityError if bad commands are issued' do
    proc do
      sandbox do
        `ls`
      end
    end.should raise_exception SecurityError
  end

  it 'should not throw an exception for errors, if the given parameter is not nil' do
    proc do
      sandbox( true ) do
        `ls`
      end
    end.should_not raise_exception
  end

  it 'should run the proc passed as parameter for errors, if it is given' do
    sandbox( lambda{|e| e.class } ) do
      `ls`
    end.should == SecurityError
  end
end

