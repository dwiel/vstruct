return function(child)
  local Root = {}
  
  function Root:execute(fd, data, env)
    env.initialize(fd, data, env)
    child:execute(env)
    return env.finalize()
  end

  function Root:gen(generator)
    generator:init()
    child:gen(generator)
    return generator:finalize(self)
  end
  
  function Root:append(...)
    return child:append(...)
  end
  
  function Root:show()
    return child:show()
  end
  
  return Root
end
