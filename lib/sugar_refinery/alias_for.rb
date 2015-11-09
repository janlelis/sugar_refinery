require 'sugar_refinery'

module SugarRefinery
  module AliasFor
    refine Module do
      private

      def alias_for(m, *aliases)
        aliases.each{ |a| class_eval "alias :'#{ a }' :'#{ m }'" }
      end

      alias aliases_for alias_for
    end
  end
end
