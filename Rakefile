require 'rake'
require 'rake/gempackagetask'
require 'rubygems'
require 'spec/rake/spectask'

Spec::Rake::SpecTask.new('spec') do |t|
  t.spec_files = FileList['lib/zucker/spec/**/*.rb']
end


# gem
PKG_FILES = FileList[ '[a-zA-Z]*', 'lib/**/*' ]
spec = Gem::Specification.new do |s|
  s.name = 'zucker'
  s.version = '1'
  s.date = '2010-08-05'
  s.authors = ['Jan Lelis']
  s.email = 'mail@janlelis.de'
  s.summary = 'Add more sugar to Ruby'
  s.homepage = 'http://rubyzucker.info'
  s.files = PKG_FILES.to_a
  s.require_paths = [".","lib"]
end

Rake::GemPackageTask.new(spec) do |pkg|
  pkg.gem_spec = spec
end

