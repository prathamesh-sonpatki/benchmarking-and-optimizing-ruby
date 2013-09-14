require 'benchmark'

# measure
puts "Benchmark.measure"
puts Benchmark.measure { 100_000.times { "Hello" * 10_000 } }
puts "\n"

puts "Benchmark.realtime"
# realtime
puts Benchmark.realtime { 100_000.times { "Hello" * 10_000 } }
puts "\n"

# With Rails we also get
# Benchmark.ms => 1000 * Benchmark.realtime

puts "Benchmark.bm"
# bm for comparing outputs of different examples
array = (0..1000).to_a.reverse
Benchmark.bm do |x|
  x.report("Sort") { array.dup.sort }
  x.report("Sort!") { array.dup.sort! }
end
puts "\n"

puts "Benchmark.bmbm"
# bmbm for eliminating the effect of memory allocation / gc
# by running rehersal first and then running again
array = (0..1000).to_a.reverse
Benchmark.bmbm do |x|
  x.report("Sort") { array.dup.sort }
  x.report("Sort!") { array.dup.sort! }
end
puts "\n"
