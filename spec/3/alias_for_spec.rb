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

# alias_method
module Blip
  def blip
    'blip'
  end
  alias_methods_for :blip, :blap, :blup
  
  class << self
    def self_blip
      'blip'
    end
    alias_methods_for :self_blip, :self_blap, :self_blup
  end
end

class Hello
  include Blip
  
  def hello
    'hello'
  end
  alias_methods_for :hello, :hi, :howdy
  
  class << self
    def self_hello
      'hello'
    end
    alias_methods_for :self_hello, :self_hi, :self_howdy
  end
end

describe 'alias_methods_for' do
  let(:h) { Hello.new }

  context "module context" do
    it "should alias instance methods" do
      h.blap.should == h.blip
      h.blup.should == h.blip
    end

    it "should alias class methods" do
      Blip.self_blap.should == Blip.self_blip
      Blip.self_blup.should == Blip.self_blip
    end
  end

  context "class context" do
    it "should alias instance methods" do
      h.hi.should == h.hello
      h.howdy.should == h.hello
    end

    it "should alias class methods" do
      Hello.self_hi.should == Hello.self_hello
      Hello.self_howdy.should == Hello.self_hello
    end
  end
end
