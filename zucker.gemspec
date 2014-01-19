# Ruby 1.9, encoding: utf-8
require File.dirname(__FILE__) + '/lib/zucker'

Gem::Specification.new do |s|
  s.name        = "zucker"
  s.version     = Zucker::VERSION
  s.authors = ['Jan Lelis','others']
  s.email = 'mail@janlelis.de'
  s.summary = "Many little helpers that sweeten your Ruby code."
  s.description = "Sweetens your Ruby code with syntactic sugar, which you do not want to miss again."
  s.homepage    = "http://rubyzucker.info"
  s.files = Dir.glob( %w[{lib,spec}/**/*.rb desc/**/*.yaml] ) + %w{Rakefile zucker.gemspec MIT-LICENSE README CHANGELOG doc/zucker_doc.rb doc/zucker_doc.html}
  s.require_paths = ["lib"]
  s.required_ruby_version = '>= 1.9.2'
  s.license = 'MIT'
  s.add_dependency 'refine', '~> 0'
  s.add_development_dependency 'rake', '~> 0'
  s.add_development_dependency 'rspec', '~> 2.14'
  s.add_development_dependency 'coderay', '~> 0'

  len = 24
  s.post_install_message = \
   ("       ┌── " + "info ".ljust(len-2,'─')                                   + "─┐\n" +
    " J-_-L │ "   + s.homepage.ljust(len,' ')                                  + " │\n" +
    "       ├── " + "usage ".ljust(len-2,'─')                                  + "─┤\n" +
    "       │ "   + "require 'zucker/default'".ljust(len,' ')                  + " │\n" +
    "       │ "   + "# or".ljust(len,' ')                                      + " │\n" +
    "       │ "   + "require 'zucker/<name>".ljust(len,' ')                    + " │\n" +
    "       └─"   + '─'*len                                                    + "─┘")
end
