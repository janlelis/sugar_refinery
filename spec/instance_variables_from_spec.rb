require 'sugar_refinery/instance_variables_from'
using SugarRefinery::InstanceVariablesFrom


describe 'instance_variables_from' do
  it 'transforms the given parameter to instance variables when in it is a binding' do
    def example_method(a = 1, b = 2)
      instance_variables_from binding # assigns @a and @b
    end

    example_method
    @a.should == 1
    @b.should == 2
  end

  it 'transforms the given parameter to instance variables when in it is a hash' do
    params = { c: 3, d: 4 }
    instance_variables_from params

    @c.should == 3
    @d.should == 4
  end
end

