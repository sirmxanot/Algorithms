abstract class IntSet {
  def contains(x: Int): Boolean
  def include(x: Int): IntSet
  def union(other: IntSet): IntSet
}

object Empty extends IntSet {
  def contains(x: Int): Boolean = false
  def include(x: Int): IntSet = new NonEmpty(x, Empty, Empty)
  override def toString = "."
  def union(other: Intset): IntSet = other
}

class NonEmpty(element: Int, left: IntSet, right: IntSet) extends IntSet {
  def contains(x: Int): Boolean = 
    if (x < element) left contains x
    else if (x > element) right contains x
    else true

  def include(x: Int): IntSet =
    if (x < element) new NonEmpty(element, left include x, right)
    else if (x > element) new NonEmpty(element, left, right include x)
    else this

  override def toString = "{" + left + element + right + "}"

  def union(other: Intset): IntSet =
    ((left union right) union other) include element


}

object TestBinaryTree {
  val t1 = new NonEmpty(3, Empty, Empty)
  val t2 = t1 include 4
  t1 == "{.3.}"
  t2 == "{.3{.4.}}"
}
