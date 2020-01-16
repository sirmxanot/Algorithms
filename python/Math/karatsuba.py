def karatsuba(x: int, y: int) -> int:
	if x < 10 and y < 10:
		return x*y

	length = max(len(str(x)),len(str(y)))
	half_length = length // 2
	
	full_shift = 10**(2*half_length)
	half_shift = 10**half_length
	
	x_left = x // half_shift
	x_right = x % half_shift
	y_left = y // half_shift
	y_right = y % half_shift

	Q1 = karatsuba(x_left, y_left)
	Q2 = karatsuba(x_right,y_right)
	Q3 = karatsuba(x_left + x_right, y_left + y_right)
	Q4 = Q3 - Q2 - Q1

	return Q1*full_shift + Q4*half_shift + Q2

print(karatsuba(3141592653589793238462643383279502884197169399375105820974944592,2718281828459045235360287471352662497757247093699959574966967627))

