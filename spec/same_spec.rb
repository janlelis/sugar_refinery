require 'sugar_refinery/same'
using SugarRefinery::Same

describe Float do
  describe '#same?' do
    it 'returns true if other float represents the same number' do
      expect( 0.3.same?(0.1 + 0.2) ).to be true
    end
  end
end
