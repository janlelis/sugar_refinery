require 'args'

describe 'arguments' do
  it 'should create a hash containing all arguments with its names' do

    def ma(hallo = 5, baum = 7)
      hallo = 9
      arguments
    end

    def mb
      arguments
    end

    ma(3).should == {:hallo => 3, :baum => 7}
    mb.should    == {}
  end
end

