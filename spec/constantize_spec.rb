require 'sugar_refinery/constantize'
using SugarRefinery::Constantize


describe 'String#constantize' do
  it 'should return the constant with that name' do
    'Object'.constantize.should == Object
  end

  it 'should also work for nested constants' do
    'SugarRefinery::VERSION'.constantize.should == SugarRefinery::VERSION
  end

  it 'should throw name error if constant does not exist (and no parameter is given)' do
    proc do
      'ObfsefsefsefafesafaefRubySugarRefineryafdfselijfesject'.constantize
    end.should raise_exception NameError
  end

  it 'should call the block (and not raise an error) if constant does not exist and block given' do
    proc do
      'ObfsefsefsefafesafaefRubySugarRefineryafdfselijfesject'.constantize do |string|
         Default = [1,2,3]
      end.should == [1,2,3]
    end.should_not raise_exception
  end

  it 'should return the second parameter (and not raise an error) if constant does not exist and parameter given' do
    proc do
      'ObfsefsefsefafesafaefRubySugarRefineryafdfselijfesject'.constantize(Array).should == Array
    end.should_not raise_exception
  end
end
