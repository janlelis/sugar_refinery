require 'zucker/version'
require 'date'

describe 'RubyVersion' do
  before :all do
    @remember_version = RUBY_VERSION
    capture_stderr{ RUBY_VERSION = '1.8.7' }
  end

  it 'should display RUBY_VERSION if called directly (to_s)' do
    RubyVersion.to_s.should == '1.8.7'
  end

  context 'with "is" method, with parameter' do
    it 'should check for main version (1.8 or 1.9) when Float paramater is given' do
      RubyVersion.is?( 1.8 ).should == true
      RubyVersion.is?( 1.9 ).should == false
    end

    it 'should check with string comparison if parameter is not Float' do
      RubyVersion.is?( '1.8' ).should == false
    end
  end

  context 'with "is" method, without parameter, but method chaining' do
    it 'should return a string for usage with comparison operators' do
      (RubyVersion.is > '1.8.7').should == false
      (RubyVersion <= '1.8.7').should == true
      (RubyVersion.is.between? '1.8.6', '1.8.7').should == true
    end

    it 'should create some handy compare aliases' do
      RubyVersion.is.above( '1.8.7' ).should == false
      RubyVersion.is.at_least( '1.8.7' ).should == true
      RubyVersion.is.exactly( '1.8.7' ).should == true
    end

    it 'also allows to check for the release dates' do
      RubyVersion.is.older_than( Date.today ).should == true
      RubyVersion.is.newer_than( '2000-01-01' ).should == true
    end
  end

  it 'should define some accessors' do
    RubyVersion.major.should == 1
    RubyVersion.minor.should == 8
    RubyVersion.tiny.should == 7
    # RubyVersion.patchlevel  # => RUBY_PATCHLEVEL
    # RubyVersion.description # => RUBY_DESCRIPTION
  end

  after :all do
    capture_stderr{ RUBY_VERSION = @remember_version }
  end
end
