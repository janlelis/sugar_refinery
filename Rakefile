require 'rake'
# require 'rubygems'
require 'rake/gempackagetask'
require 'spec/rake/spectask'

desc 'Build documentation'
task 'doc' do
  zucker_path = "#{ Rake.application.find_rakefile_location[1] }/lib/zucker"
  ruby File.join(zucker_path, 'doc/zucker_doc.rb'), zucker_path
end

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

