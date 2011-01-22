require 'zucker/regexp_to_proc'

describe 'Regexp#to_proc' do
  it 'should match the regex' do
    %w|just another string array|.map(     &/[jy]/).should == ["j", nil, nil, "y"]
    %w|just another string array|.select(  &/[jy]/).should == ["just", "array"]
  end
end

