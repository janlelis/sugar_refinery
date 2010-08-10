require 'stringio'

def capture_stdout
  capture = StringIO.new
  restore, $stdout = $stdout, capture
  yield
  $stdout = restore
  capture.string
end

def capture_stderr
  capture = StringIO.new
  restore, $stderr = $stderr, capture
  yield
  $stderr = restore
  capture.string
end

