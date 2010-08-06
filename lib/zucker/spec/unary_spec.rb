require 'zucker/unary'

describe Symbol, '#+@' do
  it 'should convert to_s' do
    +(:matz) == 'matz' # () 1.8 bug
  end
end

describe Symbol, '#-@' do
  it 'should do nothing' do
    -:matz == :matz
  end
end

describe String, '#+@' do
  it 'should do nothing' do
    +'matz' == 'matz'
  end
end

describe String, '#-@' do
  it 'should convert to_sym' do
    -'matz' == :matz
  end
end

