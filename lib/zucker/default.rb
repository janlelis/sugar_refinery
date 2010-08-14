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

zucker.each{|rb| require File.join( 'zucker', rb )}
