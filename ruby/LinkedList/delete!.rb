# Destructively deletes all nodes with a given value returns the last deleted value
require_relative 'LinkedList'

class LinkedList
  def delete!(value)
    result = nil

    self.each do |element|
      if element.value == value
        result = element.value

        if element == @head
          self.shift
        elsif element == @tail
          self.pop
        else
          self.find_by_next(element).next = element.next
        end
      end    
    end

    result
  end
end

def test
  a = [1,2,3,4,5,6]
  b = ["a","b",1,2,-3,54.5,"a","b",54.5]
  c = [0,1,2,2,1,0]
  d = []

  aa = a.to_l
  bb = b.to_l
  cc = c.to_l
  dd = d.to_l

  puts aa.delete!(2) == a.delete(2)
  puts aa.to_a == a
  puts bb.delete!("a") == b.delete("a")
  puts bb.to_a == b
  puts bb.delete!(54.5) == b.delete(54.5)
  puts bb.to_a == b
  puts cc.delete!(2) == c.delete(2)
  puts cc.to_a == c
  puts dd.delete!(2) == d.delete(2)
  puts dd.to_a == d
end
test