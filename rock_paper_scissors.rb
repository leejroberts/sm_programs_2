# method library

def header(text)
  puts "=============={ #{text} }====================="
end

def prompt(text)
  puts "==> #{text}"
end 

def name_verify(name)
  loop do
  name = gets.chomp
    if name.to_i == 0
      break
    else
      prompt('Please re-enter your name.')
    end
  end
  return name.downcase.capitalize.to_s
end

def greet(name)
  puts "Hello #{name}. let's play!"
end

def rounds_verify(number)
  loop do
  number = gets.chomp.to_i
  rounds_array = [1, 3, 5, 7]
    if rounds_array.include?(number)
      break
    else
      prompt("Please re-enter rounds: 1 , 3 , 5 , 7")
    end
  end
  return number
end

def win_lose_creator(number)
  case number
  when 1
    win_lose = 1
  when 3
    win_lose = 2
  when 5
    win_lose = 3
  when 7
    win_lose = 4
  end
  return win_lose
end

def weapon_verify(answer)
  loop do
  answer = gets.chomp.upcase.byteslice(0).to_s
  answer_array = ['R', 'P', 'S']
    if answer_array.include?(answer)
      break
    else
      prompt("Re-enter selection: R) Rock, P) Paper, S) Scissors")
    end
  end
  return answer
end

# def y_n_verify(answer)
#   loop do
#   answer=gets.chomp.upcase.byteslice(0).to_s
#     if answer == "N" || answer == "Y"
#       break
#     else prompt('want to play again? Y/N')
#     end
#   end
#   return answer
# end



# method library end

header("Welcome to Rock, Paper Scissors")
puts ''

prompt('Please enter your name')
name = name_verify(name)
greet(name)

rules = <<-MSG
OK, here's how the game works:
    ==> Paper beats Rock
    ==> Rock beats Scissors
    ==> Scissors beats Paper

MSG

rounds_mess = <<-MSG
How many rounds would you like to play?
      1) single round
      3) best of 3
      5) best of 5
      7) best of 7
MSG

prompt(rules)
prompt(rounds_mess)

rounds = rounds_verify(rounds)
win_counter = 0
lose_counter = 0
win_lose = win_lose_creator(rounds)

p win_lose


sel_weapon = <<-MSG
select your weapon:
    R) Rock
    P) Paper
    S) Scissors

    MSG

weapon_hash = {'R' => 'Rock', 'P' => 'Paper', 'S' => 'Scissors'}
prompt("OK #{name} let's play #{rounds} rounds! FIGHT!!!")

loop do
  prompt(sel_weapon)
  weapon = weapon_verify(weapon)
  user_weapon = weapon_hash[weapon]

  p weapon
  
  p user_weapon

  # comp_weapon = weapon_hash.random_select.value
  # p comp_weapon
break

end

#   Prompt("let's see what you've got!")
  
#   wins_mess = <<-MSG
#   #{name} selects #{user_weapon}, computer selects #{comp_weapon}
#   #{name} wins round!"
#   MSG

#   lose_mess = <<-MSG
#   #{name} selects #{user_weapon}, computer selects #{comp_weapon}
#   #{name} loses round..."
#   MSG

#   if user_weapon == "Rock" && comp_weapon == "Scissors"
#     puts wins_mess
#     win_counter += 1
#   elsif user_weapon == "Paper" && comp_weapon == "Rock"
#     puts wins_mess
#     win_counter += 1
#   elsif user_weapon == "Scissors" && comp_weapon == "Rock"
#     puts wins_mess
#     win_counter += 1
#   else
#     puts lose_mess
#     lose_counter += 1
#   end
# return win_counter
# return lose_counter

# player_wins = <<-MSG
# {name} has won! Computer hangs his head in shame. 
# Give  Computer a chance to redeem himself?"
# ENTER: Y/N 
# MSG

# player_loses = <<-MSG
# The computer has defeated #{name}. You want some more punk?
# ENTER: Y/N
# MSG

# if win_counter = win_lose
#   puts player_wins
# elsif lose_counter = win_lose 
#   puts player_loses
# end

# play_again = y_n_verify(play_again)
# if play_again = N
#   break
# return 

header("Thanks for playing Rock, Paper, Scissors!")




















