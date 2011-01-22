if defined? BasicObject # 1.9 only

  require 'zucker/not'

  describe 'Object#not' do
    it "should return an object on which all methods are redirected to it's receiver object, but return an inverted boolean" do
      [1,2,3].not.empty?.should == true
      nil.not.nil?.should == false
    end
  end

end
