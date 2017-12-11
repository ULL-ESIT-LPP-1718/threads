def calculate_sum(arr)
  sleep(2)
  sum = 0
  arr.each do |i|
   sum = sum + i
  end
  sum
end

@ex1 = [1,2,3]
@ex2 = [4,5,6]
@ex3 = [7,8,9]

puts "ex1 #{calculate_sum(@ex1)}"
puts "ex2 #{calculate_sum(@ex2)}"
puts "ex3 #{calculate_sum(@ex3)}"
