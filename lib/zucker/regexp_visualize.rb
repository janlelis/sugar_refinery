require 'zucker'
module Zucker RegexpVisualize = true end

class Regexp
  def visualize(string, groups = nil)
    if self =~ string
      if !groups
        puts $` + ' >' + $& + '< ' + $'
      else
        Array( groups ).each{ |group|
          begin
            gr_string = string.dup
            gr_string[ $~.end( group ),   0 ] = '< '
            gr_string[ $~.begin( group ), 0 ] = ' >'
            puts group.to_s + ': ' + gr_string
          rescue IndexError, defined?(Rubinius) &&  Rubinius::ObjectBoundsExceededError
            puts group.to_s + ': no match'
          end
        }
      end
    else
      puts 'no match'
    end

    nil
  end

  alias vis visualize
end

# J-_-L
