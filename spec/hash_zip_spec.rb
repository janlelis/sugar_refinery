require 'sugar_refinery/hash_zip'
using SugarRefinery::HashZip


describe Hash do
  describe '.zip' do
    it 'should zip together both given enumerables and take them as key=>values for a new hash' do
      Hash.zip( [1,2,3], [4,5,6] ).should == { 1=>4, 2=>5, 3=>6 }
    end
  end
end
