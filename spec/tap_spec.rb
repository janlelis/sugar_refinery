require 'zucker/tap'

describe 'tap_on' do
  it 'should call tap on the argument and apply the block' do
    obj = "an_object"
    block = :reverse.to_proc

    tap_on( obj, &block ).should == obj.tap( &block )
  end
end

describe 'make_new' do
  it 'should create a new instance of the class given as argument, apply the block on it and return result' do
    make_new Hash do |obj|
      obj[1] = 2
    end.should.send(:'==', { 1 => 2})
  end
end
