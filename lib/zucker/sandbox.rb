require 'zucker'
module Zucker Sandbox  = true end

module Kernel
  private

  def sandbox
    warn "zucker: sandbox does not work in rbx and jruby" if defined?(RUBY_ENGINE) && ( RUBY_ENGINE == 'jruby' || RUBY_ENGINE == 'rbx' )
    Thread.start do
      $SAFE = 4
      yield
    end.value
  end
end

# J-_-L

