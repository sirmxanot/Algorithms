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

  # Put an element at the beginning of the LinkedList (ptq)
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

  # Put an element at the end of the LinkedList (pbq)
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

  # Remove first element from the beginning of the LinkedList and returns it (rtq)
  def shift
    return nil if @head.nil?
    element = @head
    @head = @head.next
    return element
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

  # Destructively reverses a linked list
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

  # Non-destructively reverses a linked list
  def reverse
    new_list = LinkedList.new

    self.each do |element|
      new_list.unshift(Element.new(element.value))
    end

    return new_list
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
  b = [a,b,1,2,-3,54.5]
  c = [0,1,2,2,1,0]
  d = []

  #test to_l and to_a
  def test_to_l_and_to_a(a,b,c,d)
    a == a.to_l.to_a
    b == b.to_l.to_a
    c == c.to_l.to_a
    d == d.to_l.to_a
  end

  #test unshift
  def test_unshift(a,b,c,d)
   a.to_l.unshift(Element.new(10)).to_a == a.unshift(10)
   b.to_l.unshift(Element.new(10)).to_a == b.unshift(10)
   c.to_l.unshift(Element.new(10)).to_a == c.unshift(10)
   d.to_l.unshift(Element.new(10)).to_a == d.unshift(10)
  end

  #test push
  def test_push(a,b,c,d)
    puts a.to_l.push(Element.new(10)).to_a == a.push(10)
    puts b.to_l.push(Element.new(10)).to_a == b.push(10)
    puts c.to_l.push(Element.new(10)).to_a == c.push(10)
    puts d.to_l.push(Element.new(10)).to_a == d.push(10)
  end

  #test shift
  def test_shift(a,b,c,d)
    puts a.to_l.shift.value == a.shift
    puts b.to_l.shift.value == b.shift
    puts c.to_l.shift.value == c.shift
    puts d.to_l.shift.value == d.shift
  end

  #test_destructive reverse method
  def test_reverse!(a,b,c,d)
    puts a.to_l.reverse!.to_a == a.reverse
    puts b.to_l.reverse!.to_a == b.reverse
    puts c.to_l.reverse!.to_a == c.reverse
    puts d.to_l.reverse!.to_a == d.reverse
  end

  #test_non-destructive
  def test_reverse(a,b,c,d)
    puts a.reverse == a.to_l.reverse.to_a
    puts b.reverse == b.to_l.reverse.to_a
    puts c.reverse == c.to_l.reverse.to_a
    puts d.reverse == d.to_l.reverse.to_a
  end

  test_to_l_and_to_a(a,b,c,d)
  test_unshift(a,b,c,d)
  test_push(a,b,c,d)
  test_shift(a,b,c,d)
  test_reverse!(a,b,c,d)
  test_reverse(a,b,c,d)
end

test