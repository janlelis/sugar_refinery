require 'zucker/union'

shared_examples_for "Regexp.union operator" do
  it "should create an Regexp.union of both operands" do
    (/Ruby\d/ | /test/i | "cheat").should ==
      Regexp.union( Regexp.union( /Ruby\d/, /test/i ), "cheat" )
  end
end

describe 'Regexp#|' do
  it_should_behave_like 'Regexp.union operator'
end

describe 'String#|' do
  it_should_behave_like 'Regexp.union operator'
end

