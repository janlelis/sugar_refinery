# encoding: utf-8
require File.dirname(__FILE__) + '/lib/sugar_refinery'

Gem::Specification.new do |s|
  s.name        = "sugar_refinery"
  s.version     = SugarRefinery::VERSION
  s.authors = ['Jan Lelis']
  s.email = ['mail@janlelis.de']
  s.summary = "A sugar refinery that produces a lot of syntactic sugar to sweeten your Ruby code."
  s.description = "A sugar refinery that produces a lot of syntactic sugar (refinements) to sweeten your Ruby code."
  s.homepage    = "http://janlelis.github.io/sugar_refinery"
  s.files = Dir.glob( %w[{lib,spec}/**/*.rb desc/**/*.yaml] ) + %w{Rakefile sugar_refinery.gemspec MIT-LICENSE.txt README.md CHANGELOG.txt doc/create_documentation.rb doc/index.html}
  s.require_paths = ["lib"]
  s.license = 'MIT'

  s.required_ruby_version = '~> 2.0'
  s.add_dependency 'refine', '~> 0'
  s.add_development_dependency 'rake', '~> 10.4'
  s.add_development_dependency 'rspec', '~> 2.99'
  s.add_development_dependency 'coderay', '~> 1.1'
end
