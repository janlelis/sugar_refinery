# Ruby 1.9, encoding: utf-8
require File.dirname(__FILE__) + '/lib/zucker'

Gem::Specification.new do |s|
  s.name        = "zucker"
  s.version     = Zucker::VERSION
  s.authors = ['Jan Lelis','others']
  s.email = 'mail@janlelis.de'
  s.summary = "Sweetens your Ruby code with syntactic sugar."
  s.description = "Lots of refinements to sweeten your Ruby code"
  s.homepage    = "http://rubyzucker.info"
  s.files = Dir.glob( %w[{lib,spec}/**/*.rb desc/**/*.yaml] ) + %w{Rakefile zucker.gemspec MIT-LICENSE README.md CHANGELOG doc/create_documentation.rb doc/zucker.html}
  s.require_paths = ["lib"]
  s.required_ruby_version = '>= 1.9.2'
  s.license = 'MIT'
  s.add_dependency 'refine', '~> 0'
  s.add_development_dependency 'rake', '~> 0'
  s.add_development_dependency 'rspec', '~> 2.14'
  s.add_development_dependency 'coderay', '~> 0'
end
