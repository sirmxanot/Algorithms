# Classic linked list implementation with basic class methods

class Element
  attr_accessor :next, :value

  def initialize(value)
    @next = nil
    @value = value
  end
end

class LinkedList
  attr_accessor :name

  def initialize
    @head = nil
    @tail = nil
  end

  # Puts an element at the beginning of the LinkedList (ptq)
  def unshift(element)
    if @head.nil?
      @head = element
      @tail = element
    else
      element.next = @head
      @head = element
    end
    return self
  end

  # Puts an element at the end of the LinkedList (pbq)
  def push(element)
    if @head.nil?
      @head = element
      @tail = element
    else
      @tail.next = element
      @tail = element
    end
    return self
  end

  # Removes first element from the beginning of the LinkedList and returns it (rtq)
  def shift
    return nil if @head.nil?
    element = @head
    @head = @head.next
    return element
  end

  # Removes the last element from the end of the LL and returns it
  def pop
    return nil if @head.nil?
    element = @tail
    @tail = self.find_by_next(element)
    @tail.next = nil unless @tail.nil?
    return element
  end

  # Returns the last element whose next points to the argument element
  def find_by_next(element)
    result = nil

    self.each do |node|
      result = node if node.next == element
    end
    return result
  end

  include Enumerable

  def each 
    return nil if @head.nil?
    element = @head

    until element.nil?
      yield element
      element = element.next
    end
  end

  # Converts LinkedLists to Arrays
  def to_a
    a = Array.new

    self.each do |element|
      a.push(element.value)
    end

    return a
  end
end

class Array
  #converts arrays to LinkedLists
  def to_l
    ll = LinkedList.new

    self.each do |element|
      l_element = Element.new(element)
      ll.push(l_element)
    end

    return ll
  end
end

# basic unit tests
def test
  a = [1,2,3,4,5,6]
  b = ["a","b",1,2,-3,54.5]
  c = [0,1,2,2,1,0]
  d = []

  def test_to_l_and_to_a(a,b,c,d)
    puts "test to_l and to_a"
    puts a == a.to_l.to_a
    puts b == b.to_l.to_a
    puts c == c.to_l.to_a
    puts d == d.to_l.to_a
  end

  def test_unshift(a,b,c,d)
    puts "test unshift"
    puts a.to_l.unshift(Element.new(10)).to_a == a.unshift(10)
    puts b.to_l.unshift(Element.new(10)).to_a == b.unshift(10)
    puts c.to_l.unshift(Element.new(10)).to_a == c.unshift(10)
    puts d.to_l.unshift(Element.new(10)).to_a == d.unshift(10)
  end

  def test_push(a,b,c,d)
    puts "test push"
    puts a.to_l.push(Element.new(10)).to_a == a.push(10)
    puts b.to_l.push(Element.new(10)).to_a == b.push(10)
    puts c.to_l.push(Element.new(10)).to_a == c.push(10)
    puts d.to_l.push(Element.new(10)).to_a == d.push(10)
  end

  def test_shift(a,b,c,d)
    puts "test shift"
    puts a.to_l.shift.value == a.shift
    puts b.to_l.shift.value == b.shift
    puts c.to_l.shift.value == c.shift
    puts d.to_l.shift.value == d.shift
  end

  def test_pop(a,b,c,d)
    puts "test pop"
    aa = a.to_l
    
    puts aa.pop.value == a.pop
    puts aa.pop.value == a.pop
    puts b.to_l.pop.value == b.pop
    puts c.to_l.pop.value == c.pop
    puts d.to_l.pop.value == d.pop
  end

  def test_find_by_next(a,b,c,d)
    puts "test find_by_next"
    aa = a.to_l
    bb = b.to_l
    cc = c.to_l

    aa.each do |element|
      puts aa.find_by_next(element.next) == element
    end

    bb.each do |element|
      puts bb.find_by_next(element.next) == element
    end

    cc.each do |element|
      puts cc.find_by_next(element.next) == element
    end
  end

  test_to_l_and_to_a(a,b,c,d)
  test_unshift(a,b,c,d)
  test_push(a,b,c,d)
  test_shift(a,b,c,d)
  test_pop(a,b,c,d)
  test_find_by_next(a,b,c,d)
end

test