from typing import List

def merge_and_count_sort(a: List[int]) -> tuple:
	length = len(a)
	half_length = length // 2
	inversion_count = 0

	if length == 1:
		return inversion_count, a

	l_count, l_sorted = merge_and_count_sort(a[:half_length])
	r_count, r_sorted = merge_and_count_sort(a[half_length:])
	s_count = 0
	sorted_list = []

	l_length = len(l_sorted)
	r_length = len(r_sorted)
	i = 0
	j = 0

	while i < l_length and j < r_length:
		if l_sorted[i] <= r_sorted[j]:
			sorted_list.append(l_sorted[i])
			i += 1
		else:
			sorted_list.append(r_sorted[j])
			s_count += l_length - i
			j += 1

	while i < l_length:
		sorted_list.append(l_sorted[i])
		i += 1

	while j < r_length:
		sorted_list.append(r_sorted[j])
		j += 1
			
	inversion_count = l_count + r_count + s_count

	return inversion_count, sorted_list

with open ("inversion_input.txt", "r") as input_file:
	unsorted_list = [int(line.rstrip()) for line in input_file]
	count, sorted_list = merge_and_count_sort(unsorted_list)
	print(count)

