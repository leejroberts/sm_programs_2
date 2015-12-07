# need to build methods to verify all enteries
# also a message summary would be super banging
# possibly build hash that holds the loan summary 
# that is stored and can be called again


def prompt(mess) # prompt for all questions
  puts "==> #{mess}"
end

def header(welcome)
  puts "=================#{welcome}====================="
end

header("Welcome to the loan calculator!")

def name_checker(name)
  if name.to_s != 0
    "please re-enter your name"
  else "Hello #{name}"
    break
end

# request name and greet loop
name =''
loop do
  prompt('please enter your name:')
  name = gets.chomp.to_s.downcase.capitalize # name
  name_checker(name)
end

# main loop for calculator
loop do
  prompt("what is the amount of your loan?")
  l = gets.chomp.to_f # amount

  prompt("what is the duration of the loan in months?")
  n = gets.chomp.to_f #duration in months

  prompt("what is the APR?")
  i = gets.chomp.to_f # Annual Interest Rate
  c = i/n # monthly interest rate

  #fixed monthly payment = P
  P = (l * ((c * (1 + c)**n) / ((1 + c)**n - 1))) 
  puts "$#{P} is your fixed monthly payment"

  prompt('have you made any monthly payments yet?')
  answer = gets.chomp.to_s
  case answer
  when 'y'
    puts "how many months have you made payments for?"
    p = gets.chomp.to_f # number of monthly payments made
    # remaining loan balance after p months
    b = l*((1 + c)**n - (1 + c)**p)/((1 + c)**n - 1)
    # b = remaining balance
    puts "$#{b} is your remaining loan balance."
    puts "OK, would you like to calculate another loan?"
    another_loan = gets.chomp.to_s.downcase
    break unless another_loan == 'y'
  else
    puts "OK, would you like to calculate another loan?"
    another_loan = gets.chomp.to_s.downcase
    break unless another_loan == 'y'
  end
end

