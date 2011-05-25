require 'zucker'
module Zucker Tap = true end

def tap_on(obj, &block)
  obj.tap(&block)
end

def make_new(what, *args, &block)
  what.new(*args).tap(&block)
end

# J-_-L
