require 'zucker/iterate'

describe 'Object#iterate' do
  let :a   do [1, 2, 3]     end
  let :b   do %w|a b c d|   end
  let :res do Hash.new {[]} end

  it 'should behave like Enumerable#each for a single argument' do
    iterate a do |ele|
      res[:iter] << ele
    end

    a.each do |ele|
      res[:each] << ele
    end

    res[:iter].should == res[:each]
  end

  it 'should pass the right params to the block' do
    res = Hash.new {[]} # TODO: why?
    res[:iter_a_b] = [] # ....
    res[:iter_b_a] = [] # ....


    iterate a, b do |e,f|
      res[:iter_a_b] << [e, f]
    end

    res[:iter_a_b].should == [
      [1, 'a'],
      [2, 'b'],
      [3, 'c'],
      [nil, 'd'],
    ]

    iterate b, a do |e,f|
      res[:iter_b_a] << [e, f]
    end

    res[:iter_b_a].should == [
      ['a', 1],
      ['b', 2],
      ['c', 3],
      ['d', nil],
    ]

  end

  it 'should return enumerators if no block is applied' do
    res = Hash.new {[]} # TODO: why?
    res[:iter_a_b] = [] # ....
    res[:iter_b_a] = [] # ....

    enumerator = iterate a,b
    enumerator.should be_kind_of(RUBY_VERSION < '1.9' ? Enumerable::Enumerator : Enumerator)
    enumerator.to_a.should == [[1,'a'], [2,'b'], [3,'c'], [nil, 'd']]
  end
end
