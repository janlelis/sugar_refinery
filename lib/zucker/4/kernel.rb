require 'zucker'

module Kernel
  def activate_warnings!
    $VERBOSE = true
  end

  def deactivate_warnings!
    $VERBOSE = false
  end

  def library?
    __FILE__ != $PROGRAM_NAME
  end

  def executed_directly?
    __FILE__ == $PROGRAM_NAME
  end
  alias standalone? executed_directly?

  def ignore_sigint! # ctrl+c
     Signal.trap *%w|SIGINT IGNORE|
  end
end

# J-_-L

