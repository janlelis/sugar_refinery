require 'zucker/square_brackets_for'

describe 'square_brackets_for' do

  before do
    class Klass
      def initialize
        @var = {
          :a_key => 1,
          :another_one => 2,
        }
      end

      @eigenvar = {
        :a_key => 99
      }
    end
  end

  it 'should define a [] getter (not a setter) for an instance var, if the second parameter is false' do

    class Klass
      square_brackets_for :var, nil
    end

    a = Klass.new
    a[:a_key].should == 1

    proc do
      a[:this_is] = 'not possible'
    end.should raise_exception NoMethodError
  end

  it 'should define [] and []= for accessing an instance variable' do

    class Klass
      square_brackets_for :var
    end

    a = Klass.new
    a[:a_key].should == 1

    a[:this_is] = 'useful'
    a[:this_is].should == 'useful'
  end

  it 'should also work for class-instance variables' do

    class Klass
      class << Klass
        square_brackets_for :eigenvar
      end
    end

    Klass[:a_key].should == 99
  end

end

