from typing import List
class QuickSort:
	def sort(self, l: List[int]) -> List[int]:
		if len(l) == 1:
			return l
		self.l = l
		pivot = self.selectPivotFirst()
		self.partition(pivot)
		
		return self.l

	def selectPivotFirst(self) -> int:
		return 0

	def partition(self, pivot: int):
		pivot_value = self.l[pivot]
		#put pivot first
		self.l[pivot], self.l[0] = self.l[0], self.l[pivot]
		i = 1
		j = 1
		
		while j < len(self.l):
			if self.l[j] < pivot_value:
				self.l[1], self.l[j] = self.l[j], self.l[1]
				i += 1
				
			j += 1	
		
		#put pivot in its place
		self.l[0], self.l[i-1] = self.l[i-1], self.l[0]
		QuickSort().sort(self.l[:i])
		QuickSort().sort(self.l[i:])
q = QuickSort()
print(q.sort([1,5,0,-2])==[-2,0,1,5])
