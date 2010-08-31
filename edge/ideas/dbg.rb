#rdp
def _dbg
  begin
    require 'ruby-debug'
    debugger
  rescue LoadError => e
    require 'rubygems'
    begin
      require 'ruby-debug'
    rescue LoadError => e
      throw "unable to load ruby-debug gem for _dbg... #{e}"
    end
  end
end

