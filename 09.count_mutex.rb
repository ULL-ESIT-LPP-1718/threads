#! /usr/bin/ruby

count1 = count2 = diff = 0

mutex = Mutex.new

counter = Thread.new do
  loop do
    mutex.synchronize do
      count1 += 1
      count2 += 1
    end
  end
end

spy = Thread.new do
  loop do
    mutex.synchonize do
      diff += (count1 -count2).abs
    end
  end
end

sleep(rand(0.1))

print "count1    : #{count1}\n"
print "count2    : #{count2}\n"
print "difference: #{diff}\n"