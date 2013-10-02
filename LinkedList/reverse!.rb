# Destructively reverses a linked list
require_relative 'LinkedList'

class LinkedList
  def reverse!
    return nil if @head.nil?

    @tmp_head = self.shift
    @tmp_head.next = nil
    @tail = @tmp_head

    until @head.nil?
      element = self.shift
      element.next = @tmp_head
      @tmp_head = element
    end

    @head = @tmp_head
    return self
  end 
end

#test_destructive reverse method
def test
  a = [1,2,3,4,5,6]
  b = ["a","b",1,2,-3,54.5,"a","b",54.5]
  c = [0,1,2,2,1,0]
  d = []

  puts a.to_l.reverse!.to_a == a.reverse
  puts b.to_l.reverse!.to_a == b.reverse
  puts c.to_l.reverse!.to_a == c.reverse
  puts d.to_l.reverse!.to_a == d.reverse
end

test