require 'clone_deep'

describe 'Array#clone_deep' do
  it 'create a deep copy' do
    a = [1,2,3,4,["Hallo",["Welt"],[]]]
    b = a.clone_deep
    b.should == a
    b[5][3,1] = ''
    b.should != a
  end
end

