require 'zucker/alias_for'
using Zucker::AliasFor


describe 'alias_for' do
  it 'should create an alias for instance methods' do
    class Array
      def m2
        2
      end
      aliases_for :m2, :a2, :'a-2'
    end
    proc do
      [1,2,3].a2.should == 2
      [1,2,3].send('a-2').should == 2
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

    proc{
      Array.a3.should == 3
    }.should_not raise_exception
  end


  it 'should create aliases for the first argument with all other arguments' do
    class Object
      def m4
        4
      end
      alias_for :m4, :ma, :mb, :mc
    end

    proc{
      1.ma.should   == 4
      "1".mb.should == 4
      [1].mc.should == 4
    }.should_not raise_exception
  end

  it 'works with uncommon chars' do
    class Object
      alias_for :tainted?, :"tain-ted?"
    end
  end
end
