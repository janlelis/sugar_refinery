require 'zucker'

def activate_warnings!
  $VERBOSE = true
end

def deactivate_warnings!
  $VERBOSE = false
end

def library?
  __FILE__ != $PROGRAM_NAME
end

def ignore_sigint! # ctrl+c
   Signal.trap *%w|SIGINT IGNORE|
end

# J-_-L

