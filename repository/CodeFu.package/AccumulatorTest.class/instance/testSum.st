test
testSum

	| a |
	a := Accumulator sum.
	a enumerate: #(1 2 3 4 5 6 7 8 9 10).
	self assert: a value = 55.