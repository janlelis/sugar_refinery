require 'rake'
require 'rake/gempackagetask'
require 'rubygems'
require 'spec/rake/spectask'

PKG_FILES = FileList[ '[a-zA-Z]*', 'lib/**/*' ]
spec = Gem::Specification.new do |s|
  s.name = 'zucker'
  s.version = '0.9'
  s.date = '2010-08-05'
  s.authors = ['Jan Lelis']
  s.email = 'mail@janlelis.de'
  s.summary = 'Add more sugar to Ruby'
  s.homepage = 'http://rubyzucker.info'
  s.files = PKG_FILES.to_a
  s.require_paths = [".","lib"]
end

desc 'build gem'
Rake::GemPackageTask.new(spec) do |pkg|
  pkg.gem_spec = spec
end

