require 'zucker/mcopy'

describe 'Object#mcopy' do
  it 'create a (deep) copy via marshalling' do
    a = %w[hello world]
    b = a.mcopy
    b.should == a

    b[0][1,1] = ''
    b.should_not == a
  end
end

