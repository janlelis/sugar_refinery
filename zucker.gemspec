# Ruby 1.9, encoding: utf-8
require 'rubygems' unless defined? Gem
require File.dirname(__FILE__) + '/lib/zucker'

Gem::Specification.new do |s|
  s.name        = "zucker"
  s.version     = Zucker::VERSION
  s.authors = ['Jan Lelis','others']
  s.email = 'mail@janlelis.de'
  s.summary = "Many little helpers that sweeten your Ruby code :)."
  s.description = "Sweetens your Ruby code with syntactic sugar :).
Adds a lot of little helpers that you do not want to miss again."
  s.homepage    = "http://rubyzucker.info"
  s.files = Dir.glob( %w[{lib,spec}/**/*.rb desc/**/*.yaml] ) + %w{Rakefile zucker.gemspec MIT-LICENSE README CHANGELOG doc/zucker_doc.rb doc/zucker_doc.html .gemtest}
  s.require_paths = ["lib"]
  s.required_ruby_version = '>= 1.8.7' # 1.9 recommended
  s.license = 'MIT'
  s.add_development_dependency 'rspec'
  s.add_development_dependency 'coderay'

  len = s.homepage.size
  s.post_install_message = \
   ("       ┌── " + "info ".ljust(len-2,'%')                                   + "─┐\n" +
    " J-_-L │ "   + s.homepage                                                 + " │\n" +
    "       ├── " + "usage ".ljust(len-2,'%')                                  + "─┤\n" +
    "       │ "   + "require 'zucker/all'".ljust(len,' ')                      + " │\n" +
    "       │ "   + "# or".ljust(len,' ')                                      + " │\n" +
    "       │ "   + "require 'zucker/<name>".ljust(len,' ')                    + " │\n" +
    "       └─"   + '─'*len                                                    + "─┘").gsub('%', '─') # 1.8 workaround
end
