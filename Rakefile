require 'rake'
require 'rspec/core/rake_task'
require 'fileutils'

if RUBY_VERSION >= '1.9.2'
  require_relative 'lib/zucker'
else
  require 'lib/zucker'
end

@path = Rake.application.find_rakefile_location[1]

desc 'Build documentation'
task 'doc' do
  ruby File.join(@path, 'doc/zucker_doc.rb'), @path
end

task 'default' => 'spec'
RSpec::Core::RakeTask.new('spec') do |t|
  t.ruby_opts = "-r " + File.join(@path, 'spec', 'spec_helper')

  if RUBY_VERSION < '1.9'
    t.pattern = File.join(@path, 'spec', '*_spec.rb')
  else
    t.pattern = File.join(@path, 'spec', '*.rb')
  end
end

# gem
def gemspec
  @gemspec ||= eval(File.read( File.join(@path, 'zucker.gemspec') ), binding, 'zucker.gemspec')
end

desc "Build the gem"
task :gem => :gemspec do
  sh "gem build zucker.gemspec"
  FileUtils.mkdir_p 'pkg'
  FileUtils.mv "#{gemspec.name}-#{gemspec.version}.gem", 'pkg'
end

desc "Install the gem locally"
task :install => :gem do
  sh %{gem install pkg/#{gemspec.name}-#{gemspec.version}}
end

desc "Validate the gemspec"
task :gemspec do
  gemspec.validate
end

# release
desc 'run specs, build doc, bump version, set date, copy version directories and add these changes to git'
task 'prepare_release' => %w[spec] do # run specs
  # really want to release?
  print 'Do you really want to release? ...then enter release: '
  exit if $stdin.gets.chomp != 'release'

  # bump version and date
  require 'date'
  zucker_rb = File.read('lib/zucker.rb')
  zucker_rb.sub! /VERSION\s*=.*(\d+).*$/ do "VERSION = '#{ @v = $1.to_i + 1 }'" end
  zucker_rb.sub! /DATE\s*=.*$/, "DATE = '#{Date.today}'"
  File.open 'lib/zucker.rb','w' do |f| f.write zucker_rb end

  `rake doc`

  # add changes to git and tag
  `git add .`
  `git commit -m 'Ruby Zucker #@v :)'`
  `git tag -a v#@v -m 'Ruby Zucker #@v :)'`

   # done
   puts "prepared Zucker #@v gem release"
end

desc 'prepare_release, build gem, and push it to git and display rubygems push command'
task 'release' => %w[gem] do
  `git push origin master`
  `git push origin master --tags`
  last_gem = Dir['pkg/zucker-*.gem'].sort[-1] # TODO read version from lib/zucker.rb for zucker-10
  puts "gem push pkg/#{last_gem}"
end
