#! /usr/bin/ruby

count1 = count2 = 0
diff = 0

counter = Thread.new do
  loop do
    count1 += 1
    count2 += 1
  end
end

spy = Thread.new do
  loop do
    diff = count1 - count2
  end
end

sleep 1


print "count1    : #{count1}\n"
print "count2    : #{count2}\n"
print "difference: #{diff}\n"
