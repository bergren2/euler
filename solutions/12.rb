@prev_triangle_nums = {}

def triangle_number n
  unless @prev_triangle_nums[n]
    if n == 1
      @prev_triangle_nums[n] = 1
    else
      @prev_triangle_nums[n] = n + triangle_number(n - 1)
    end
  end

  @prev_triangle_nums[n]
end

def factors n
  a = []
  r = (n ** 0.5).floor
  (1..r).each do |i|
    if n % i == 0
      a.push(i)
      a.push(n / i) unless n / i == i
    end
  end
  a
end

# for n > 1, does n have an even number of factors?
# if so, we only have to look for root n pairs

i = 1
factors_count = 0
while factors_count <= 500
  t = triangle_number i
  f = factors(t)
  printf "%d: %s\n", t, f

  # update
  i += 1
  factors_count = f.size
end
# print trinagle_number(i - 1) #lazy