require 'zucker/unary_conversion'
using Zucker::UnaryConversion


describe Symbol, '#+@' do
  it 'should convert to_s' do
    +:matz == 'matz'
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

