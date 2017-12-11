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

threads = (1..3).map do |i|
  Thread.new(i) do
    ex = instance_variable_get("@ex#{i}")
    puts "ex#{i} #{calculate_sum(ex)}"
  end
end

threads.each {|t| t.join}
