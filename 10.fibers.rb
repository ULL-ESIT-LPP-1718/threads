#! /usr/bin/ruby

counts = Hash.new(0)
File.foreach("fichero") do |line|
  line.scan(/\w+/) do |word|
     word = word.downcase
     counts[word] += 1
  end
end
counts.keys.sort.each {|k| print "#{k}:#{counts[k]} "}

print "\n Con fibras \n"

words = Fiber.new do
  File.foreach("fichero") do |line|
    line.scan(/\w+/) do |word|
      Fiber.yield word.downcase
    end
  end
end
contadores = Hash.new(0)
while word = words.resume
  contadores[word] += 1
end
contadores.keys.sort.each {|k| print "#{k}:#{contadores[k]} "}
