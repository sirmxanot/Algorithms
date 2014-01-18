import math.Ordering
object mergeSort {
  def msort[T](xs: List[T])(implicit ord: Ordering[T]): List[T] = {
    val middle = xs.length/2
    if (middle == 0) xs
    else {
      def merge(xs: List[T], ys: List[T]): List[T] = (xs, ys) match {
        case (Nil, ys) => ys
        case (xs, Nil) => xs
        case (l :: ls, r :: rs) => 
          if (ord.lt(l,r)) l :: merge(ls,ys)
          else r :: merge(xs,rs)
        }
      }
      val (left, right) = xs splitAt middle
      merge(msort(left), msort(right))
    }
  }

  val nums = List(2,7,-1,0,3)
  val fruits = List("apple", "pineapple", "orange", "banana")

  msort(nums)
  msort(fruits)
}