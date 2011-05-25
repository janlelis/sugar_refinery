require 'zucker'
module Zucker Kernel = true end

module Kernel
  private

  def activate_warnings!
    $VERBOSE = true
  end

  def deactivate_warnings!
    $VERBOSE = false
  end

  def library?
    caller[0].rindex(/:\d+(:in `.*')?$/)
    $PROGRAM_NAME != $` # __FILE__
  end

  def executed_directly?
    caller[0].rindex(/:\d+(:in `.*')?$/)
    $PROGRAM_NAME == $` # __FILE__
  end
  alias standalone? executed_directly?
  alias directly_executed? executed_directly?

  def irb?
    (defined?(IRB) && $0 =~ /irb/) || (defined?(Ripl) && $0 =~ /ripl/)
  end

  def ignore_sigint! # ctrl+c
    Signal.trap(*%w|SIGINT IGNORE|)
    true
  end

  def ignore_sigquit! # ctrl+\
    Signal.trap(*%w|SIGQUIT IGNORE|)
    true
  end
end

# J-_-L
