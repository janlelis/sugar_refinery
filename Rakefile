require 'rake'
# require 'rubygems'
require 'rake/gempackagetask'
require 'spec/rake/spectask'

if RUBY_VERSION >= '1.9.2'
  require_relative 'lib/zucker'
else
  require 'lib/zucker'
end

desc 'Build documentation'
task 'doc' do
  zucker_path = Rake.application.find_rakefile_location[1]
  ruby File.join(zucker_path, 'doc/zucker_doc.rb'), zucker_path
end

task 'default' => 'spec'
Spec::Rake::SpecTask.new('spec') do |t|
  t.spec_files = FileList['spec/*.rb']
end

# gem
PKG_FILES = FileList[ '[a-zA-Z]*', 'lib/**/*' ]
spec = Gem::Specification.new do |s|
  s.name = 'zucker'
  s.version = Zucker::VERSION
  s.date = Zucker::DATE
  s.authors = ['Jan Lelis','and many others']
  s.email = 'mail@janlelis.de'
  s.summary = "Sweeten your Ruby code with this syntactic sugar :).
Adds a lot of little helpers that you do not want to miss again.
See http://rubyzucker.info"
  s.homepage = 'http://rubyzucker.info'
  s.files = PKG_FILES.to_a
  s.require_paths = ["lib"]
  s.required_ruby_version = '>= 1.8.7' # 1.9 recommended
end

Rake::GemPackageTask.new(spec) do |pkg|
  pkg.gem_spec = spec
end

# release
desc 'run specs, build doc, bump version, set date, copy version directories and add these changes to git'
task 'prepare_release' => %w[spec doc] do # run specs and doc
  # really want to release?
  print 'Do you really want to release? ...then enter release: '
  exit if $stdin.gets.chomp != 'release'

  # bump version and date
  require 'date'
  zucker_rb = File.read('lib/zucker.rb')
  zucker_rb.sub! /VERSION\s*=.*(\d+).*$/ do "VERSION = '#{ @v = $1.to_i + 1 }'" end
  zucker_rb.sub! /DATE\s*=.*$/, "DATE = '#{Date.today}'"
  File.open 'lib/zucker.rb','w' do |f| f.write zucker_rb end

  # copy version directories
  `mkdir lib/zucker/#@v`
  `cp lib/zucker/*.* lib/zucker/#@v/`
  `mkdir desc/#@v`
  `cp desc/*.* desc/#@v/`
  `mkdir doc/#@v`
  `cp doc/*.* doc/#@v/`
  `mkdir spec/#@v`
  `cp spec/*.* spec/#@v/`

  # add changes to git and tag
  `git add .`
  `git commit -m'prepared Zucker #@v gem release'`
  `git tag -a 'v#@v'`
end

desc 'prepare_release, build gem, and push it to git and rubygems'
task 'release' => 'prepare_release, gem' do
  `git push origin master --tags`
  last_gem = Dir['pkg/zucker-*.gem'].sort[-1] # TODO better sorting for zucker-10
  `gem push pkg/#{last_gem}`
end
