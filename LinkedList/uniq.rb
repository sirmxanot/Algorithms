# Non-destructively removes duplicates from a linked list
require_relative 'LinkedList'

class LinkedList
  def uniq
    elements = Hash.new

    self.each do |element|
      elements[element.value] = element.value unless elements.has_key?(element)
    end

    elements.keys.to_l
  end
end

def test
  a = [1,2,3,4,5,6]
  b = ["a","b",1,2,-3,54.5,"a","b",54.5]
  c = [0,1,2,2,1,0]
  d = []

  puts a.to_l.uniq.to_a == a.uniq
  puts b.to_l.uniq.to_a == b.uniq
  puts c.to_l.uniq.to_a == c.uniq
  puts d.to_l.uniq.to_a == d.uniq
end

test