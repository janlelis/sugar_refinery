=begin usage
  activate_warnings!: "activate_warnings! # sets $VERBOSE to 1"
  deactivate_warnings!: "deactivate_warnings! # sets $VERBOSE to 0"
  executed_directly?, standalone?: "executed_directly? # checks, if the current file is run directly -> true"
  library?: "library? # checks, if the current file is run directly -> false"
  ignore_sigint!: "ignore_sigint! # blocks CTRL+C"
=end
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

