#Print 1-255
puts "\nPrint 1-255"

(1..255).each { |num| puts num }

#Print odd numbers between 1-255
puts "\nPrint odd numbers between 1-255"

(1..255).each { |num| puts num unless num.odd? }

#Print Sum
puts "\nPrint Sum"

sum = 0
(1..255).each { |num| puts "New number: " + num.to_s + " Sum: " + (sum+=num).to_s}

#Iterating through an array
puts "\nIterating through an array"

arr = [1,3,5,7,9,13]
arr.each { |i| puts i }

#Find Max
puts "\nFind Max"

arr =  [-3, -5, -7]
def find_max(list)
  max = list[0]
  list.each { |num| max = num if num > max }
  return max
end

puts find_max(arr)

arr.max

#Get Average
puts "\nGet Average"

arr = [1,3,5,7,9,13]

def get_average(list)
  sum = 0
  list.each { |num| sum += num }
  average = sum / list.length
  average
end

puts get_average(arr)

#Array with Odd Numbers
puts "\nArray with Odd Numbers"

y = []
(1..255).each { |num| y.push (num) if num.odd? }
puts y

#Greater Than Y
puts "\nGreater Than Y"

arr = [1,3,5,7,9,13]

def greater_than(list, y)
  count = 0
  list.each { |num| count +=1 if num > y }
  return count
end

puts greater_than(arr, 5)

#Square the values
puts "\nSquare the values"

x = [1, 5, 10, -2]

x.map! { |num| num * num }

puts x

#Eliminate Negative Numbers
puts "\nEliminate Negative Numbers"

x = [1, 5, 10, -2]

x.each_index { |i| x[i] = 0 if x[i] < 0 }
puts x

#Max, Min, and Average
puts "\nMax, Min, and Average"

x = [1, 5, 10, -2]
def min_max_avg(list)
  return {min: list.min, max: list.max, average: list.reduce(:+)/list.length}
end

puts min_max_avg(x)

#Shifting the Values in the Array
puts "\nShifting the Values in the Array"

x =  [1, 5, 10, 7, -2]
def shift(list)
  list.each_index { |i| list[i] = list[i+1]}
  list[-1] = 0
  return list
end

puts shift(x)

#Number to String
puts "\nNumber to String"

arr = [-1, -3, 2]
def number_to_string(list)
  list.each_index { |i| list[i] = 'Dojo' if list[i] < 0 }
  return list
end

puts number_to_string(arr)
