#!/usr/bin/env ruby

# Create a method that takes an array as a parameter. Within that method, try calling methods that do not mutate the caller. How does that affect the array outside of the method? What about when you call a method that mutates the caller within the method?

class Array
	def my_non_mutate_reverse
		self.reverse
	end
	def my_mutate_reverse
		self.reverse!
	end
end

a = [1, 2, 3, 4, 5]

a.my_non_mutate_reverse
puts a.join(',')
a.my_mutate_reverse
puts a.join(',')