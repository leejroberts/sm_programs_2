# !!!!!y_m_converter not working currently

# ========== METHOD LIBRARY BEGIN: =====================
def prompt(mess) # prompt for all questions
  puts "==> #{mess}"
end

def header(welcome) # welcome header
  puts "==========={ #{welcome} }==============="
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
  return name
end

def amount_check(l)
  loop do
    l = gets.chomp
    if l.to_i.to_s != "0"
      break
    else
      prompt("Please re-enter your loan amount")
    end
  end
  return l.to_f
end

def duration_checker(n) # checks loan duration
  loop do
    n = gets.chomp
    if n.to_i.to_s == n.to_s
      break
    else
      prompt('please re-enter your loan duration')
    end
  end
  return n.to_i
end

def y_m_checker(time) # checks unit of measure for loan time
  loop do
    time = gets.chomp.upcase.byteslice(0).to_s
    if time == 'M' || time == 'Y'
      break
    else
      prompt('Enter: M for months, Y for years')
    end
  end
  return time
end

def y_m_converter(time, n)
  case time
  when 'M'
    n = n
  when 'Y'
    n *= 12 
  end
  return n
end

def APR_checker(var)
  loop do
    var = gets.chomp
    if var.to_s.include? "."
      break
    elsif var.to_i == 0
      prompt('Please re-enter APR __%')
    else
      var = var.to_f / 100
      break
    end
  end
  return var.to_f
end


def yes_no_checker(answer) # checks payment response for Y or N
  loop do
    answer = gets.chomp.upcase.byteslice(0).to_s
    if answer == 'Y' || answer == 'N'
      break
    else
      prompt("Enter: Y for yes, N for no")
    end
  end
  return answer
end

def pay_num_checker(var) # checks loan duration
  loop do
    var = gets.chomp
    if var.to_i.to_s == var.to_s
      break
    else
      prompt('Please re-enter payments made as a whole number')
    end
  end
  return var.to_i
end
    
# ========== METHOD LIBRARY END======================

header("Welcome to the loan calculator!")

# => name and greet loop
name =''
prompt('Please enter your name:')
name = name_check_get_greet(name)


# => main loop for calculator  
loop do
  # l = loan amount
  prompt("What is the amount of your loan?")
  l= amount_check(l) # checks for valid entry
  
   # n = duration of loan 
  prompt("What is the duration of the loan?")
  n = duration_checker(n) # checks duration entry
  prompt("#{n} months or years? enter: Y / M")
  time = y_m_checker(time) #checks for months or years
  y_m_converter(time, n) # converts n from months ==> years; if necc

  prompt("what is the APR?")
  i = APR_checker(i) # i = Annual Interest Rate
  c = i/n # c = monthly interest rate 

  # f = fixed monthly payment
  f = (l * ((c * (1 + c)**n) / ((1 + c)**n - 1))) 
  puts "$#{f} is your fixed monthly payment"

  prompt('have you made any monthly payments yet?')
  payment = yes_no_checker(payment) # checks answer for validity
  case payment
  when 'N'
    prompt ("OK, would you like to calculate another loan?")
    another_loan = yes_no_checker(another_loan)
    break unless another_loan == 'Y'
  when 'Y'    
    puts "how many months have you made payments for?" 
    p = pay_num_checker(p) # checking for valid p = no. of payments made
    b = l*((1 + c)**n - (1 + c)**p)/((1 + c)**n - 1)
    # b = remaining balance after p monthly payments
    puts "$#{b} is your remaining loan balance."
    puts "OK, would you like to calculate another loan?"
    another_loan = yes_no_checker(another_loan)
    break unless another_loan == 'Y'
  end
end

header("Thank you #{name} for utilizing the Loan Calculator")















