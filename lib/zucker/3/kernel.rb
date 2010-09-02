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

  # version getter  
  def ruby_1_9?
    RUBY_VERSION[2,1] == '9'
  end

  def ruby_1_8?
    RUBY_VERSION[2,1] == '8'
  end

  def ruby_1_9!
    if RUBY_VERSION[2,1] != '9'
      fail NotImplementedError, "Sorry, this script requires Ruby 1.9, but was executed with a different Ruby version!"
    end
    true
  end

  def ruby_1_8!
    if RUBY_VERSION[2,1] != '8'
      fail NotImplementedError, "Sorry, this script requires Ruby 1.8, but was executed with a different Ruby version!"
    end
    true
  end
end

# J-_-L

