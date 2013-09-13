require 'awesome_print'

module ObjectCounter
  def self.count
    GC.disable
    before_count = ObjectSpace.count_objects
    yield
    after_count  = ObjectSpace.count_objects
    after_count.each do |k,v|
      after_count[k] = v - before_count[k]
    end
    GC.enable
    after_count
  end
end


object_count = ObjectCounter.count do
  100_000.times { "Hello" * 10_100 }
end

ap object_count
