require './object_counter'
require 'benchmark'

include ObjectCounter

content = "Hello [first_name]"

gsub_count = count do
  100_000.times { content.gsub(/\[first_name\]/, 'Prathamesh') }
end

p gsub_count

gsub_bang_count = count do
  100_000.times { content.gsub!(/\[first_name\]/, 'Prathamesh') }
end

p gsub_bang_count

Benchmark.bmbm do |x|
  x.report { 100_000.times { content.gsub(/\[first_name\]/, 'Prathamesh') } }
  x.report { 100_000.times { content.gsub!(/\[first_name\]/, 'Prathamesh') } }
end
