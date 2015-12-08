# need to build methods to verify all enteries
# also a message summary would be super banging
# possibly build hash that holds the loan summary 
# that is stored and can be called again

# ========== METHOD LIBRARY BEGIN: =====================
def prompt(mess) # prompt for all questions
  puts "==> #{mess}"
end

def header(welcome) # welcome header
  puts "=================#{welcome}====================="
end

# gets name checks and greets
def name_check_get_greet(name)
  loop do
  name = gets.chomp.to_s.downcase.capitalize # name
    if name.to_i == 0
      puts "Hello #{name} let's calculate a loan!"
      break
    else
      prompt('Invalid entry, Please re-enter your name:')
    end
  end
end

def amount_check(l)
  loop do
    if l.to_s.to_i != 0
      break
    else
      puts "please re-enter your loan amount"
      l = gets.chomp.to_f
    end
  end
end

def duration_checker(n) # checks loan duration
  loop do
    if n.to_s.to_i 
      prompt('please re-enter your loan duration')
      n = gets.chomp.to_i
    else
      break
    end
  end
end

def y_m_checker(time) # checks unit of measure for loan time
  loop do
    if time != 'M' || 'Y'
      prompt('Enter: M for months, Y for years')
    else
      break
    end
  end
end

# def y_m_converter(time, n)
#   case time
#   when 'Y'
#     n = n / 12
#   when 'M'
#     n = n
#   end
# end
    
# ========== METHOD LIBRARY END======================

header("Welcome to the loan calculator!")

# request name and greet loop
name =''
prompt('please enter your name:')
name_check_get_greet(name)


# # main loop for calculator  
# loop do
  # l = loan amount
  prompt("what is the amount of your loan?")
  l = gets.chomp.to_f # amount
  amount_check(l)
  
   # n = duration of loan 
  prompt("what is the duration of the loan?")
  n = gets.chomp.to_i
  duration_checker(n) # checks duration entry
  prompt(" #{n} months or years? enter: Y / M")
  time = gets.chomp.upcase.byteslice(0).to_s #WORKING
  y_m_checker(time) #checks for months or years
  # y_m_converter(time) # converts n from months ==> years; if necc

  puts n

  puts time

#   prompt("what is the APR?")
#   i = gets.chomp.to_f # i = Annual Interest Rate
#   c = i/n # c = monthly interest rate 

#   # f = fixed monthly payment
#   f = (l * ((c * (1 + c)**n) / ((1 + c)**n - 1))) 
#   puts "$#{f} is your fixed monthly payment"

#   prompt('have you made any monthly payments yet?')
#   answer = gets.chomp.to_s
#   case answer
#   when 'y'
#     puts "how many months have you made payments for?"
#     p = gets.chomp.to_f # number of monthly payments made
   
#     b = l*((1 + c)**n - (1 + c)**p)/((1 + c)**n - 1)
#     # b = remaining balance after p monthly payments
#     puts "$#{b} is your remaining loan balance."
#     puts "OK, would you like to calculate another loan?"
#     another_loan = gets.chomp.to_s.downcase
#     break unless another_loan == 'y'
#   else
#     puts "OK, would you like to calculate another loan?"
#     another_loan = gets.chomp.to_s.downcase
#     break unless another_loan == 'y'
#   end
# end














