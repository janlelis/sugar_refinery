require 'sugar_refinery/marshal_copy'
using SugarRefinery::MarshalCopy


describe 'Object#marshal_copy' do
  it 'create a (deep) copy via marshalling' do
    a = %w[hello world]
    b = a.marshal_copy
    b.should == a

    b[0][1,1] = ''
    b.should_not == a
  end
end

