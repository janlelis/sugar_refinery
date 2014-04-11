require "zucker/itself"
using Zucker::Itself


describe "Object#itself" do
  it "should return itself" do
    string = "pony"

    string.itself.should           == string
    string.itself.object_id.should == string.object_id
  end
end
