# Non-destructively reverses a linked list
require_relative 'LinkedList'

class LinkedList
  def reverse
    new_list = LinkedList.new

    self.each do |element|
      new_list.unshift(Element.new(element.value))
    end

    new_list
  end

  def reverse_2
    new_list = LinkedList.new

    until self.tail.nil?
      new_list.push self.pop
    end

    new_list
  end
end

def test
  a = [1,2,3,4,5,6]
  b = ["a","b",1,2,-3,54.5,"a","b",54.5]
  c = [0,1,2,2,1,0]
  d = []

  puts a.reverse == a.to_l.reverse.to_a
  puts b.reverse == b.to_l.reverse.to_a
  puts c.reverse == c.to_l.reverse.to_a
  puts d.reverse == d.to_l.reverse.to_a

  puts a.reverse == a.to_l.reverse_2.to_a
  puts b.reverse == b.to_l.reverse_2.to_a
  puts c.reverse == c.to_l.reverse_2.to_a
  puts d.reverse == d.to_l.reverse_2.to_a
end

test