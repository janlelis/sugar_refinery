require_relative 'version'

Dir["#{File.dirname(__FILE__)}/*"].each{ |f|
  require_relative File.basename(f)
}
