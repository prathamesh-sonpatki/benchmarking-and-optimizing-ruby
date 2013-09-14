require 'benchmark'

name = "Matz"

Benchmark.bmbm do |x|
  x.report("Addition")      { 100_000.times { "Hi" + name + "!\n" + "Welcome to Pune Ruby User Group" } }
  x.report("Concatenation") { 100_000.times { "Hi" << name << "!\n" << "Welcome to Pune Ruby User Group" } }
  x.report("Interpolation") { 100_000.times { "Hi #{name}!\n Welcome to Pune Ruby User Group"  } }
end
