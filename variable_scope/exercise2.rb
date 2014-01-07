#!/usr/bin/env ruby

# 2 Create a local variable at an inner scope (within a do/end block) and try to reference it in the outer scope. What happens when you have nested do/end blocks?

[1,2].each do |i|
	inner_var1 = i
end

puts inner_var1 # Gives an error because outer scope does not have access to variables from inner scope


[1,2].each do |i|
	inner_var1 = i
	[1,2].each do |i|
		puts inner_var1 # inner block has access to variable from outer scope
	end
end

[1,2].each do |i|
	[3,4].each do |i|
			inner_var1 = i
	end
	puts inner_var1 # outer block does not have access to variables from inner block 
end