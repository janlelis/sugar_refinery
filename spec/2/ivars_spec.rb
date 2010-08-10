require 'zucker/ivars'

describe 'instance_variables_from' do
  it 'should tansform the given parameter to instance variables' do
    def a_method(a = 1, b = 2)
      instance_variables_from binding # assigns @a and @b

      params = {:c => 3, :d => 4}
      ivars params # # assigns @c and @d
    end

    a_method
    @a.should == 1
    @b.should == 2
    @c.should == 3
    @d.should == 4

  end
end

