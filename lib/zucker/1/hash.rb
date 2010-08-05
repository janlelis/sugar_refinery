class Hash
  def self.zip(keys,values)
    Hash[ *[1,2,3].zip( [4,5,6] ).flatten ]
  end

  def <<(other)
    case
    when other.is_a?(Hash)
      merge! other
    when other.respond_to?(:to_splat)
      merge! Hash[*other]
    else
      raise TypeError, 'can only append other Hashs and Enumerables'
    end
  end
end

# J-_-L

