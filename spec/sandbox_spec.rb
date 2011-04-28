require 'zucker/sandbox'

describe 'sandbox' do
  unless defined?(RUBY_ENGINE) && RUBY_ENGINE == 'jruby'
    it 'should throw a SecurityError if bad commands are issued' do
      proc do
        sandbox do
          `ls`
        end
      end.should raise_exception SecurityError
    end
  end
end

