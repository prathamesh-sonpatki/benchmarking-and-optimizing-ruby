require 'benchmark'

puts Benchmark.measure { 100_000.times { "Hello" * 10_000 } }

puts Benchmark.realtime { 100_000.times { "Hello" * 10_000 } }

# With Rails we also get
# Benchmark.ms => 1000 * Benchmark.realtime
