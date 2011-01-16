# Ruby 1.9, encoding: utf-8
require 'rubygems' unless defined? Gem
require File.dirname(__FILE__) + '/lib/zucker'

Gem::Specification.new do |s|
  s.name        = "zucker"
  s.version     = Zucker::VERSION
  s.authors = ['Jan Lelis','and others']
  s.email = 'mail@janlelis.de'
  s.summary = "Many little helpers that sweeten your Ruby code :)."
  s.description = "Sweeten your Ruby code with syntactic sugar :).
Adds a lot of little helpers that you do not want to miss again."
  s.homepage    = "http://rubyzucker.info"
  s.files = Dir.glob( %w[{lib,spec}/**/*.rb desc/**/*.yaml] ) + %w{Rakefile zucker.gemspec MIT-LICENSE README CHANGELOG doc/zucker_doc.rb doc/zucker_doc.html}
  s.has_rdoc = false
  s.require_paths = ["lib"]
  s.required_ruby_version = '>= 1.8.7' # 1.9 recommended
  s.license = 'MIT'
  s.add_development_dependency 'rspec'
  s.add_development_dependency 'coderay'
end
