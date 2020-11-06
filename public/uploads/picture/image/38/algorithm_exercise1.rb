def greatest_common_divisor(a, b)
  while true
    if a < b
      a, b = b, a
    else
    end
    c = a % b
    if c == 0
      return b
    else
      a = b
      b = c
    end
  end
end
puts greatest_common_divisor(50,1110)
