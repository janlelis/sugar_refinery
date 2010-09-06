require 'zucker'

def egonil(nil_value = nil)
  yield
rescue NoMethodError => e
  if e.message =~ /NilClass$/
    nil_value
  else
    raise NoMethodError
  end
end

alias nn egonil

# J-_-L

