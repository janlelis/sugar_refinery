require 'union'

describe 'Regexp#|' do
  it 'should create an Regexp.union of both operands' do
    (/hallo/ | /\d+/ | /./).should ==
      Regexp.union( Regexp.union(/hallo/, /\d+/), /./ )
  end
end

describe 'String#|' do
  it_should_behave_like 'Regexp#|'
end

