require_relative 'version'

module SugarRefinery
  module StringOp
    refine String do
      def -(rem)
        gsub( Regexp === rem ? rem : rem.to_s, '' )
      end

      def ^(pos)
        pos = pos.to_i
        if pos >= 0
          self[pos..-1]
        else
          self[0...pos]
        end
      end
    end
  end
end
