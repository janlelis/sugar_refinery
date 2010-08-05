def require_directory(path)
  Dir[File.join path, '*.rb'].each{ |filename|
    require filename
  }
end

