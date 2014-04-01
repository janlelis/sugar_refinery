require 'fileutils'
require File.dirname(__FILE__) + '/lib/zucker'

$path = Rake.application.find_rakefile_location[1]

def gemspec
  @gemspec ||= eval(File.read( File.join($path, 'zucker.gemspec') ), binding, 'zucker.gemspec')
end

## SPEC

task 'default' => 'spec'
task 'test'    => 'spec'

desc 'Run Spec'
task 'spec' do
  sh %[rspec spec]
end

## DOC

desc 'Build documentation'
task 'doc' do
  ruby File.join($path, 'doc/create_documentation.rb'), $path
end

## BUILD

desc "Build the gem"
task :gem => :gemspec do
  sh "gem build zucker.gemspec"
  FileUtils.mkdir_p 'pkg'
  FileUtils.mv "#{gemspec.name}-#{gemspec.version}.gem", 'pkg'
end

desc "Install the gem locally"
task :install => :gem do
  sh %{gem install pkg/#{gemspec.name}-#{gemspec.version}.gem --no-rdoc --no-ri}
end

desc "Validate the gemspec"
task :gemspec do
  gemspec.validate
end
