person1 = {
  first_name: "Kevin",
  last_name: "Camp",
  email: "kcamp4632@yahoo.com",
  password: 12345
}

person2 = {
  first_name: "Bob",
  last_name: "Vila"
}

person3 = {}

puts person1
puts person2
puts person3

# .delete(key)
person1.delete :password
puts person1

# .empty?
puts "Person 2 is empty" if person2.empty?
puts "Person 3 is empty" if person3.empty?

# .has_key?(key)
puts "Person 1 has key 'email'" if person1.has_key?(:email)
puts "Person 2 has key 'email'" if person2.has_key?(:email)

# .has_value(value)
puts "Person 1 has value 'Vila'" if person1.has_value?('Vila')
puts "Person 2 has value 'Vila'" if person2.has_value?('Vila')
