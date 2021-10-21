# encoding: utf-8
require File.dirname(__FILE__) + '/lib/sugar_refinery/version'

Gem::Specification.new do |s|
  s.name        = "sugar_refinery"
  s.version     = SugarRefinery::VERSION
  s.authors = ['Jan Lelis']
  s.email = ['hi@ruby.consulting']
  s.summary = "The Ruby Sugar Refinery is a collection of tiny refinements."
  s.description = "The Ruby Sugar Refinery is a collection of tiny refinements (declarative local core extensions)."
  s.homepage    = "https://janlelis.github.io/sugar_refinery"
  s.files = Dir.glob( %w[{lib,spec}/**/*.rb desc/**/*.yaml] ) + %w{Rakefile sugar_refinery.gemspec MIT-LICENSE.txt README.md CHANGELOG.md doc/create_documentation.rb doc/index.html}
  s.require_paths = ["lib"]
  s.license = 'MIT'

  s.required_ruby_version = '>= 2.0'
  s.add_development_dependency 'rake', '~> 13.0'
  s.add_development_dependency 'rspec', '~> 2.99'
  s.add_development_dependency 'coderay', '~> 1.1'
end
