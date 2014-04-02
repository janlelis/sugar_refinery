require 'zucker'

module Zucker
  module StringExtras
    refine String do
      def lchomp(arg = $/)
        reverse.chomp(arg).reverse
      end

      def lchomp!(arg = $/)
        replace reverse.chomp(arg).reverse
      end
      
      def to_r
        a = self.partition(/\(.+?\)/)
        fail "No range in string" if a[0].empty?
        fail "Invalid range #{a}" if a.select { |v| v.match(/[A-Za-z]/) }
        eval a[1]
      end
 
      def to_r_leading_zero
        a = self.partition(/\(.+?\)/)
        fail "No range in string" if a[0].empty?
        fail "Invalid range #{a}" if a.select { |v| v.match(/[A-Za-z]/) }
        r = eval a[1]
        eval "\'#{"0" + r.first.to_s}\'..\'#{r.last.to_s}\'" if r.first.to_s.size == 1
      end
      
      alias_method :to_range, :to_r
      alias_method :to_range_leading_zero, :to_r
    end
  end
end
