require 'zucker'

require 'zucker'

# default
zucker = %w|
alias_for
aliases
array
array2proc
blank
class2proc
egonil
engine
enumerable
hash
hash2proc
info
iterate
ivars
kernel
mcopy
not
os
regexp2proc
sandbox
square_brackets_for
string
tap
unary
union
version
|

# remove 1.9 if 1.8
if RUBY_VERSION < '1.9'
  zucker -= %w|not tap union|
end

zucker.each{|rb| require File.join( 'zucker', '4', rb )}
