require 'egonil'

describe 'egonil' do
  it 'should not raise nil exceptions in the block' do
    proc do
      egonil{ nil.some_methods.that[:do].not.exist }
    end.should_not raise_exception
  end

  it 'should return the nil_value if given' do
    egonil(9){ nil.some_methods.that[:do].not.exist }.should == 9
  end

  it 'should restore default behaviour after the block' do
    proc do
      egonil{ nil.some_methods.that[:do].not.exist }
    end.should_not raise_exception

    proc do
      nil.a_method
    end.should raise_exception NoMethodError
  end

  it 'raise NoMethodError for non-nil objects' do
    proc do
      egonil{ 5.a_method }
    end.should raise_exception NoMethodError
  end
end

