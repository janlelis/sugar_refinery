require 'sugar_refinery/lchomp'
using SugarRefinery::Lchomp

describe String do
  describe '#lchomp' do
    it 'should chomp on the left side' do
      string = 'ameise'
      expect( string.lchomp('a') ).to eq 'meise'
      expect( string ).to eq 'ameise'
    end
  end

  describe '#lchomp!' do
    it 'should chomp on the left side (mutating)' do
      string = 'ameise'
      expect( string.lchomp!('a') ).to eq 'meise'
      expect( string ).to eq 'meise'
    end
  end
end
