require 'zucker'

module Kernel
  private

  def sandbox
    Thread.start do
      $SAFE = 4
      yield
    end.value
  end
end

# J-_-L

