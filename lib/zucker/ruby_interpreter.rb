Interpreter.version.must_be > '1.9.2'
Ruby.version.must_be_at_least '1.9'

Ruby.interpreter
Ruby.interpreter.must_be 'MRI', 'JRuby'
Ruby.interpreter.must_not_be 'JRuby'
Ruby.interpreter.is? 'MRI', 'JRuby'


RubyInterpreter.is? :jruby
RubyInterpreter.must_be *%w[MRI JRuby]
RubyInterpreter::NAMES

describe 'RubyVersion' do
  it 'should' do

  end
end
=end
module RubyInterpreter
  NAMES = {
    :mri =>    %w[MRI mri YARV yarv official ruby ruby-lang],
    :jruby =>  %w[JRuby JRUBY jruby Jruby java],
    :rubinius => %w[],
    :macruby => %w[],
    :iron_ruby => %w[iron_ruby iron],
    :cardinal => %w[parrot]
    :maglev => %w[maglev],

  }
end

# J-_-L
