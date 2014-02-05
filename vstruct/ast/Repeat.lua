return function(count, value)
  local Repeat = {
    tag = "repeat";
    width = (value.width and count * value.width) or nil;
    count = count;
    value = value;
  }
  
  function Repeat:show()
    io.write("repeat\t"..tostring(count).."\t")
    value:show()
  end
  
  function Repeat:execute(env)
    if count > 0 then
      for i=1,count do
        value:execute(env)
      end
    end
  end
  
  return Repeat
end
