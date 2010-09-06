def arguments
  mbinding = @@last_bindings[2]
  margs = mbinding.eval "local_variables"
  ret = {}

  margs.each{ |arg|
    ret[arg.to_sym] = mbinding.eval(arg)
  }
  ret
end
alias args arguments

#### EVIL ####
# set up binding tracer
@@last_bindings ||= []
set_trace_func lambda { |event, _, _, _, binding_, _|
  if event[/call/]
#p binding_.eval "local_variables" if binding_
    @@last_bindings.unshift binding_
    @@last_bindings.pop if @@last_bindings.size > 5
  end
}

