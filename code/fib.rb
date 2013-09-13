require 'benchmark'
require './object_counter'

def naive_fib(n)
  return n if (0..1).include? n
  naive_fib(n-1) + naive_fib(n-2) if n > 1
end

def fib(n)
  return n if n < 2
  fib(n-1) + fib(n-2)
end

input = ARGV[0].to_i

# Benchmark.bmbm do |bm|
#   bm.report { naive_fib input }
#   bm.report { fib input }
# end

p count { fib input }
