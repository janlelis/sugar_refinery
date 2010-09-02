require 'zucker'

module Info
  class << Info
    # hash like access
    def [](what)
      send what
    end

    # TODO: maybe add a descriptions method
  end

  module_function

  # current script file
  def current_file
    __FILE__
  end

  def current_file_directory
    File.dirname(__FILE__)
  end

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

  def process_id
    $$
  end

  def load_path
    $:
  end

  # current
  def current_line
    __LINE__
  end

  def current_method # 1.9
    __method__
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
    global_variables
  end

  def global_constants
    Object.constants
  end

  # encoding (1.9)
  def source_encoding
    __ENCODING__
  end

  def external_encoding
    Encoding.default_external
  end

  def internal_encoding
    Encoding.default_internal
  end

  # ruby version info
  def ruby_version
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
end

