require 'zucker/alias_for'

describe 'alias_for' do
  it 'should create an alias for global methods' do
    # rspec bug? 
    # def m1
    #   1
    # end
    # alias_for :m1, :a1
    #
    # proc do
    #   a1.should == 1
    # end.should_not raise_exception
  end

  it 'should create an alias for instance methods' do
    class Array
      def m2
        2
      end
      alias_for :m2, :a2
    end
    proc do

      [1,2,3].a2.should == 2
    end.should_not raise_exception
  end

  it 'should create an alias for class (singleton) methods' do
    class Array
      class << Array
        def m3
          3
        end
        alias_for :m3, :a3
      end
    end

    proc do
      Array.a3.should == 3
    end.should_not raise_exception
  end


  it 'should create aliases for the first argument with all other arguments' do
    class Object
      def m4
        4
      end
    alias_for :m4, :ma, :mb, :mc
    end
    proc do
      1.ma.should   == 4
      "1".mb.should == 4
      [1].mc.should == 4
    end.should_not raise_exception
  end
end
