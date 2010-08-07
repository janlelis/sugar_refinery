def sandbox(rescueblock_or_default=nil)
  Thread.start do
    $SAFE = 4
    yield
  end.value
rescue SecurityError => e
  if !rescueblock_or_default.nil?
    if rescueblock_or_default.is_a? Proc
      rescueblock_or_default.call e
    else
      rescueblock_or_default
    end
  else
    raise e
  end
end

# J-_-L

