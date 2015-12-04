# ask the user for two numbers
# ask the user for an operation
# perform the operaton on the two numbers
#output the result

puts "Welcome to the Calculator!"
puts "what is the first number?"
a = gets.chomp
puts "what is the second number?"
b = gets.chomp

puts "what operaton: 1) add 2) subtract 3) multiply 4) divide"
operator = gets.chomp.to_i

if operator == 1
  puts "the result is #{a.to_i+ b.to_i}"
elsif operator == 2
  puts "the result is #{a.to_i - b.to_i}"
elsif operator == 3
  puts "the result is #{a.to_i * b.to_i}"
else 
  puts "the result is #{a.to_f / b.to_f}"
end

    

#put 1 (a, b) {puts a + b}
#def 2 (a, b) {puts a - b}
#def 3 (a, b) {puts a * b}
#def 4 (a, b) {puts a / b}
