def repeat_string(str)
  size = str.length
  if size < 4
    puts str * 3
  else
    word = str.slice(0, 4)
    puts word * 3
  end
end


repeat_string('Python')
repeat_string('Go')
repeat_string('C++')
repeat_string('Java')
