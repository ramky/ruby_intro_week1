#!/usr/bin/env ruby

# 1 Create a local variable and modify it at an inner scope (in between a do/end block). You can try
# a) re-assigning the variable to something else
# b) call a method that doesn’t mutate the caller
# c) call a method that mutates the caller.

var1 = 123
str1 = "bob smith"
str2 = nil
str3 = nil

10.times do |number|
	var1 = number
end
puts var1

1.times do
		str1.capitalize
end
puts str1


1.times do
	str1.capitalize!
end
puts str1
