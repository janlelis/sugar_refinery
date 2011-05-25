require 'zucker'
require 'rbconfig'
require 'etc'
module Zucker Info = true end

module Info
  class << self
    # hash like access
    def [](what)
      send what
    end

    # list available info methods
    def list
      singleton_methods - [:[], :list, '[]', 'list']
    end
  end

  module_function

  # input
  def last_input_file
    $FILENAME
  end

  def last_input_line_number
    $.
  end

  def last_input
    $_
  end

  # program
  def program_name
    $0
  end

  def program_arguments
    $:
  end

  def loaded_programs
    $"
  end

  def program_data
    ::DATA
  end

  def child_program_status
    $CHILD_STATUS
  end

  # system info
  def environment
    ::ENV
  end
  alias env environment

  def working_directory
    Dir.pwd
  end

  def platform
    ::RUBY_PLATFORM
  end

  def os
    RbConfig::CONFIG['host_os']
  end

  def process_id
    $$
  end

  def load_path
    $:
  end

  # user
  def user_login
    Etc.getlogin
  end

  def user_name
    Etc.getpwnam(user_login).gecos.split(',')[0]
  end

  # current

  def current_file #  __FILE__
    return $` if caller[0].rindex(/:\d+(:in `.*')?$/)
  end

  def current_file_directory
    if current_file[0,1] == '(' && current_file[-1,1] == ')'
      current_file
    else
      File.dirname(current_file)
    end
  end

  def current_line # __LINE__
    return $1.to_i if caller[0].rindex( /:(\d+)(:in `.*')?$/ )
  end

  def current_method # __method__ (except aliases)
    return $1.to_sym if caller(1)[0].rindex( /\`([^\']+)\'/ )
  end

  def current_callstack
    caller
  end

  # dealing with strings
  def gets_separator
    $/
  end

  def join_separator
    $,
  end

  def print_separator
    $,
  end

  def split_separator
    $;
  end

  # misc
  def security_level
    $SAFE
  end

  def warnings_activated?
    $VERBOSE
  end

  def debug_activated?
    $DEBUG
  end

  def last_exception
    $!
  end

  # defined objects
  def global_variables
    Object.send :global_variables
  end

  def global_constants
    Object.constants
  end

  # encoding (1.9)
  #def source_encoding
  #  __ENCODING__
  #end

  def external_encoding
    Encoding.default_external
  end

  def internal_encoding
    Encoding.default_internal
  end

  # ruby version info
  def ruby_version # also see the RubyVersion cube
    ::RUBY_VERSION
  end

  def ruby_patchlevel
    ::RUBY_PATCHLEVEL
  end

  def ruby_description
    ::RUBY_DESCRIPTION
  end

  def ruby_release_date
    ::RUBY_RELEASE_DATE
  end

  def ruby_engine # warning! not support by every implementation. It's saver to use the RubyEngine cube
    ::RUBY_ENGINE
  end
end

