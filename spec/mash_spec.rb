require 'sugar_refinery/mash'
using SugarRefinery::Mash


describe 'Array#mash' do
  it 'should "map" a hash' do
    [1,2,3].mash{|e| [e, e.to_s] }.should == {1=>'1',2=>'2',3=>'3',}
  end
end


describe 'Enumerator#mash' do
  it 'should "map" a hash' do
    [1,2,3].each.mash{|e| [e, e.to_s] }.should == {1=>'1',2=>'2',3=>'3',}
  end
end

