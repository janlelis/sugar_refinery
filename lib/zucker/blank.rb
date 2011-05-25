require 'zucker'
module Zucker Blank = true end

class Object
  def blank?
    if respond_to? :empty? then empty? else !self end
  end

  def present?
    !blank?
  end
end


{ # what to do              # for which classes
  lambda{ true }         => [FalseClass, NilClass],
  lambda{ false }        => [TrueClass, Numeric],
  lambda{ empty? }       => [Array, Hash],
  lambda{ self !~ /\S/ } => [String],
  lambda{ self == //   } => [Regexp],

}.each{ |action, klass_array|
  klass_array.each{ |klass|
    klass.send :define_method, :blank?, &action
  }
}

# J-_-L

