
# transfers all prompt messages to below yaml file
require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')

# method library
# adds an arrow to all prompts =>
def prompt(message)
  puts("=> #{message}")
end

# checks if number entered is an integer or a float
# does not work on the number zero!!!!
def valid_number?(number)
  number.to_f.to_s == number || number.to_i.to_s == number
end

prompt MESSAGES['welcome']

# globalizes name var
name = ''

# validates name var
loop do 
  name = gets.chomp
  if name.empty?
    prompt(MESSAGES["valid_name"])
  else
    break
  end
end

prompt(MESSAGES["hello"])

loop do # main loop
  a = "" # globalizes first number to a
  b = "" # globalizes second number to b

# gets var a/ validates var a
  loop do 
    prompt(MESSAGES["first_number"])
    a = gets.chomp
    if valid_number?(a)
      break
    else
      prompt(MESSAGES["invalid_number"])
    end
  end

  # gets var a/ validates var a
  loop do 
    prompt(MESSAGES["second_number"])
    b = gets.chomp
    if valid_number?(b)
      break
    else
      prompt(MESSAGES["invalid_number"])
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
  prompt(MESSAGES['calc_again?'])
  answer = gets.chomp
  break unless answer.downcase.start_with?('y') # breaks out of calculator with answer not y
  # answer = y returns user to start of MAIN loop (does not rewelcome/ask name)
end