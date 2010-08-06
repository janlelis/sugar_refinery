def sandbox(rescueblock=nil)
  Thread.start do
    $SAFE = 4
    yield
  end.value
rescue SecurityError => e
  if rescueblock
    rescueblock.call e
  else
    raise e
  end
end

# J-_-L

