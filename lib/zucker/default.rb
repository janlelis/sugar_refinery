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
enumerable
hash
hash2proc
info
iterate
ivars
kernel
mcopy
not
regexp2proc
sandbox
square_brackets_for
string
tap
unary
union
|

# remove 1.9 if 1.8
if RUBY_VERSION < '1.9'
  zucker -= %w|not tap union|
end

zucker.each{|rb| require File.join( 'zucker', rb )}
