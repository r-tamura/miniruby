def load_program(path)
  return File.read(File.join(Dir.pwd(), path))
end
