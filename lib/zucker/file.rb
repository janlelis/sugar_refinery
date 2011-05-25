require 'zucker'
module Zucker File = true end

class << File
  def gsub(filename, regex_hash)
    data = File.read filename
    File.open(filename,'w'){ |file|
      regex_hash.each{ |regex, new_string|
        regex = regex.to_s unless regex.is_a? Regexp

        if new_string.is_a? Proc
          data.gsub! regex, &new_string
        else
          data.gsub! regex, new_string
        end
      }
      file.print data
    }
  end

  def delete! filename
    return nil if !File.exist?(filename)
    File.delete filename
  end
end

# J-_-L

