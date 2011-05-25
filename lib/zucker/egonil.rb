require 'zucker'
module Zucker Egonil = true end

# code by Yohan, slightly edited and comments by me
def egonil(&block)
  # grip methods
  ori_method_missing   = NilClass.instance_method(:method_missing)
  catch_method_missing = NilClass.instance_method(:catch_method_missing)
  # activate ego mode
  NilClass.send :define_method, :method_missing, catch_method_missing
  # run code
  yield
ensure
  # no matter what happens: restore default nil behaviour
  NilClass.send :define_method, :method_missing, ori_method_missing
end

# this is the ego nil
class NilClass
  def catch_method_missing(m, *args, &block)
    nil
  end
end

alias nn egonil

# J-_-L

