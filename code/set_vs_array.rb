require 'benchmark'
require 'set'

set   = Set.new
array = Array.new

def random
  100_000 * rand
end

Benchmark.bmbm do |x|
  x.report("Insertion in Sets") { 100_000.times { set << random } }
  x.report("Insertion in Arrays") { 100_000.times { array << random } }

  x.report("Lookup in Sets") { 10_000.times { set.include? random } }
  x.report("Lookup in Arrays") { 10_000.times { array.include? random } }
end
