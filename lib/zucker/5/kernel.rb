require 'zucker'

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

  def irb?
    !!(( IRB and $0 == 'irb' ) rescue nil)
  end

  def ignore_sigint! # ctrl+c
     Signal.trap *%w|SIGINT IGNORE|
  end
end

# J-_-L
