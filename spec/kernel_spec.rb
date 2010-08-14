require 'zucker/kernel'

describe 'activate_warnings!' do
  it 'should set $VERBOSE to true' do
    activate_warnings!
    $VERBOSE.should == true
  end
end

describe 'deactivate_warnings!' do
  it 'should set $VERBOSE to false' do
    deactivate_warnings!
    $VERBOSE.should == false
  end
end

describe 'library?' do
  it 'should return false if the file is invoked directly' do
    library?.should == ( __FILE__ != $PROGRAM_NAME )
  end
end

describe 'executed_directly?' do
  it 'should return true if the file is invoked directly' do
    executed_directly?.should == ( __FILE__ == $PROGRAM_NAME )
  end
end

describe 'ignore_sigint!' do
  it 'should catch ctrl+c signals' do
    # ...
  end
end

describe 'ruby_1_8? and ruby_1_9?' do
  it 'should return true if run with the right ruby version' do
    # ...
  end
end

describe 'ruby_1_8! and ruby_1_9!' do
  it 'should throw a NotImplementedError if run with the wrong ruby version' do
    # ...
  end
end
