// This is an implementation of an immutable linked list (cons list)
trait LinkedList[T] {
  def isEmpty: Boolean
  def head: T
  def tail: LinkedList[T]
}

class Cons[T](val head: T, val tail: LinkedList[T]) extends LinkedList[T] {
  def isEmpty = false
}

class Nil[T] extends LinkedList[T] {
  def isEmpty: Boolean = true
  def head: Nothing = throw NoSuchElementException("Nil.head")
  def tail: Nothing = throw NoSuchElementException("Nil.tail")
}

def singleton[T](element: T) = new Cons[T](element, new Nil[T])

object nth {
  def nth[T](n: Int, xs: LinkedList[T]) = {
    if (cs.isEmpty) throw new IndexOutofBoundException
    else if (n == 0) xs.head
    else nth(n-1, xs.tail)
  }
}