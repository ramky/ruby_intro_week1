#!/usr/bin/env ruby

# 1. Use the "each" method of Array to iterate over [1, 2, 3, 4, 5, 6,
# 7, 8, 9, 10], and print out each value.

[1, 2, 3, 4, 5, 6, 7, 8, 9, 10].each { |i| puts i }

#2. Same as above, but only print out values greater than 5.

[1, 2, 3, 4, 5, 6, 7, 8, 9, 10].each { |i| puts i if i > 5 }

#3. Now, using the same array from #2, use the "select" method to extract all odd numbers into a new array.

new_array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10].select { |i| i%2 == 1 }
puts new_array.join(',')

# 4. Append "11" to the end of the array. Prepend "0" to the
# beginning.

array = [1,2,3,4,5,6,7,8,9,10]
array.push 11
array.unshift 0

#5. Get rid of "11". And append a "3".

array.pop
array.push 3

#6. Get rid of duplicates without specifically removing any one value.

array.uniq!

#7. What's the major difference between an Array and a Hash?

# Array is an ordered list of values, individual values can be
#accessed using index which starts with 0

# Hash is a collection of key-value pairs, indexing is done via
#arbitrary keys of any object type (not just integer)

#8. Create a Hash using both Ruby 1.8 and 1.9 syntax.
#Suppose you have a h = {a:1, b:2, c:3, d:4}

hash18 = {:a => 1, :b => 2, :c => 3, :d => 4}
hash19 = {a: 1, b: 2, c: 3, d: 4}

#9. Get the value of key "b".

hash19[:b]

#10. Add to this hash the key:value pair {e:5}

hash19[:e] = 5

#13. Remove all key:value pairs whose value is less than 3.5

hash19.delete_if { |k,v| v < 3.5 }

#14. Can hash values be arrays? Can you have an array of hashes? (give examples)

# Yes, hash values can be arrays.  For example
member = {
  number: 123,
  name: 'Bob Smith',
  hobbies: ['reading', 'walking', 'music']
}

# Yes, we can have an array of hashes.  Like so
employees = [
	{number: 1, name: 'Bob', salary: '100k'},
	{number: 50, name: 'Smith,', salary: '117k'},
	{number: 100, name: 'Emily', salary: '150k'}
]

#15. Look at several Rails/Ruby online API sources and say which one your like best and why.
