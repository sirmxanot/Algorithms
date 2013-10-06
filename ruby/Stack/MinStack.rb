# NOT COMPLETE!
# Basic stack implemented with ruby array plus min method

class Stack
  attr_reader :contents

  def initialize(input = Array.new)
    @contents = input.clone
    @min = @contents.min
  end

  def push(element)
    @min = element if element > @min
    @contents.unshift(element)
  end

  def pop
    
    @contents.pop
  end

  def min
    @min
  end
end

def test
  a = [1,2,3,4,5,6]
  b = ["a","b",1,2,-3,54.5]
  c = [0,1,2,2,1,0]
  d = []

  puts 'test initialize and viewing contents'
  puts Stack.new(a).contents == a
  puts Stack.new(b).contents == b
  puts Stack.new(c).contents == c
  puts Stack.new(d).contents == d

  puts 'test push'
  aa = Stack.new(a)
  puts aa.push(7) == a.unshift(7)
  puts aa.push(8) == a.unshift(8)
  puts Stack.new(b).push("d")[0] == "d"

  puts 'test pop'
  bb = Stack.new(b)
  puts bb.pop == b.pop
  puts bb.pop == b.pop
  puts bb.contents == b
end
test