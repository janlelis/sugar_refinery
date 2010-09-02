require 'zucker'

# default
zucker = %w|
aliases
array
array2proc
blank
class2proc
egonil
enumerable
hash
hash2proc
iterate
ivars
kernel
mcopy
regexp2proc
sandbox
square_brackets_for
string
unary
union
|

zucker.each{|rb| require "zucker/1/#{rb}"}

