require 'awesome_print'

module ObjectCounter
  def self.count
    GC.disable
    before_count = ObjectSpace.count_objects
    yield
    after_count  = ObjectSpace.count_objects
    after_count.each do |k,v|
      after_count[k] = v.to_i - before_count[k].to_i
    end
    GC.enable
    after_count
  end
end


object_count = ObjectCounter.count do
  1000.times { Hash.new }
end

ap object_count
