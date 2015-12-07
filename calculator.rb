
# method library
# adds an arrow to all prompts =>
def prompt(message)
  puts("=> #{message}")
end

# checks if number entered is a number
# does not work on the number zero!!!!
def valid_number?(number)
  number.to_i != 0
end

prompt("Welcome to the Calculator! Enter your name:")

# globalizes name var
name = ''

# validates name var
loop do 
  name = gets.chomp
  if name.empty?
    prompt("make sure to use a valid name.")
  else
    break
  end
end

prompt("hello #{name}!")

loop do # main loop
  a = "" # globalizes first number to a
  b = "" # globalizes second number to b

# gets var a/ validates var a
  loop do 
    prompt("what is the first number?")
    a = gets.chomp
    if valid_number?(a)
      break
    else
      prompt("that is not a valid number. Try another!")
    end
  end

  # gets var a/ validates var a
  loop do 
    prompt("what is the second number?")
    b = gets.chomp
    if valid_number?(b)
      break
    else
      prompt("that is not a valid number. Try another!")
    end
  end

  # Prompt for calculation
  operator_prompt = <<-MSG
  what calculation would you like to perform?
    1) add
    2) subtract
    3) multiply
    4) divide
  MSG

  # Prompt for incorrect calculation selection
  fix_prompt = <<-MSG
    1) add
    2) subtract
    3) multiply
    4) divide
  MSG

  prompt(operator_prompt)
  operator = ''

  # assesses validity of operaton selection 1 2 3 4
  loop do
    operator = gets.chomp
    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt(fix_prompt)
    end
  end
  # takes the selection of the operator
  # makes a message telling what operation calc is performing
  def operation_to_message(op)
    case op
    when '1'
      "adding"
    when '2'
      'subtracting'
    when '3'
      'multiplying'
    when '4'
      'dividing'
    end
  end

  prompt("#{operation_to_message(operator)} your numbers...")# oper to message created above^

  result = case operator # determines the operation calculator performs
           when '1'
             a.to_i + b.to_i
           when '2'
             a.to_i - b.to_i
           when '3'
             a.to_i * b.to_i
           when '4'
             a.to_f / b.to_f
           end

  prompt("The result is #{result}")
  prompt("Do you want to perform another calculation? (Y to calculate again)")
  answer = gets.chomp
  break unless answer.downcase.start_with?('y') # breaks out of calculator with answer not y
  # answer = y returns user to start of MAIN loop (does not rewelcome/ask name)
end