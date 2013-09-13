# each_object

# All objects of a specific class
count = ObjectSpace.each_object(Complex) { |o| puts o }
p count

# Complete class heirarchy
ObjectSpace.each_object(Class) { |c| p c.name }

# Start GC
p GC.stat[:count]
ObjectSpace.garbage_collect # Same as GC.start
p GC.stat[:count]

# _id2ref
str = "GC is awesome"
p ObjectSpace._id2ref(str.object_id) == str

# count_objects
