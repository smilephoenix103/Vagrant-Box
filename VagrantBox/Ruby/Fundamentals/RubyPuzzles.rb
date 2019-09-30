=begin
Create an array with the following values: 3,5,1,2,7,9,8,13,25,32. Print the sum of all numbers in the array. Also have the function return an array that only include numbers that are greater than 10 (e.g. when you pass the array above, it should return an array with the values of 13,25,32 - hint: use reject or find_all method)
=end

myArray = [3,5,1,2,7,9,8,13,25,32]
puts myArray.reduce(:+)

def greater_than_10(list)
  list.reject! { |num| num <= 10 }
  return list
end

puts greater_than_10(myArray)

=begin
Create an array with the following values: John, KB, Oliver, Cory, Matthew, Christopher. Shuffle the array and print the name of each person. Have the program also return an array with names that are longer than 5 characters.
=end

nameArray = ["John", "KB", "Oliver", "Cory", "Matthew", "Christopher"]
nameArray.shuffle!
nameArray.each { |name| puts name}

puts "\nNames with 5 or more characters"
nameArray.reject! { |name| name.length <= 5 }
puts nameArray

=begin
Create an array that contains all 26 letters in the alphabet (this array must have 26 values). Shuffle the array and display the last letter of the array. Have it also display the first letter of the array. If the first letter in the array is a vowel, have it display a message.
=end
puts "\nCreate array with alphabet, then shuffle and display last and first"
alphabet = ('a'..'z').to_a
puts "Alphabet array:"
puts alphabet
alphabet.shuffle!
puts "last letter in shuffled array"
puts alphabet[-1]
puts "first letter in shuffled array"
puts alphabet[0]
puts "1st letter is a vowel" if ['a','e','i','o','u'].include?(alphabet[0])

#Generate an array with 10 random numbers between 55-100.
puts "\nArray with 10 random numbers"
random_array = []
for i in 1..10
  random_array.push rand(55-100)
end

puts random_array

=begin
Generate an array with 10 random numbers between 55-100 and have it be sorted (showing the smallest number in the beginning). Display all the numbers in the array. Next, display the minimum value in the array as well as the maximum value
=end
puts "\nSorted random array with min max"
random_array.sort!
puts random_array
puts "\nArray min value: " + (random_array.min).to_s
puts "\nArray max value: " + (random_array.max).to_s

#Create a random string that is 5 characters long (hint: (65+rand(26)).chr returns a random character)
puts "\nRandom string with 5 characters"
random_string = ""
for i in (1..5)
  random_string << (65+rand(26)).chr
end

puts random_string

#Generate an array with 10 random strings that are each 5 characters long
puts "\nArray with 10 random strings"
myArray = []

for i in (1..10)
  random_string = ""
  for i in (1..5)
    random_string << (65+rand(26)).chr
  end
  myArray.push(random_string)
end

puts myArray
