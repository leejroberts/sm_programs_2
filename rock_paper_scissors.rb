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

def round_puts(user_weapon, comp_weapon, name, round_counter)
  if user_weapon == "Rock" && comp_weapon == "Scissors" ||
    user_weapon == "Paper" && comp_weapon == "Rock" ||
    user_weapon == "Scissors" && comp_weapon == "Paper"
  puts "#{name} selects #{user_weapon}, computer selects #{comp_weapon}
  #{name} wins round #{round_counter + 1}!"
  elsif user_weapon == comp_weapon
    puts "You both selected #{user_weapon}. round #{round_counter + 1} is a draw."
  else
    puts "#{name} selects #{user_weapon}, computer selects #{comp_weapon}
    #{name} loses round #{round_counter + 1}."
  end
end

def win_lose_counter(user_weapon, comp_weapon, win_lose)
  if user_weapon == "Rock" && comp_weapon == "Scissors" ||
    user_weapon == "Paper" && comp_weapon == "Rock" ||
    user_weapon == "Paper" && comp_weapon == "Rock"
    win_lose += 1
  elsif user_weapon == comp_weapon
    win_lose + 0 
  else
    win_lose -= 1
  end
  return win_lose
end
  
def y_n_verify(answer)
  loop do
  answer = gets.chomp.upcase.byteslice(0).to_s
    if answer == "N" || answer == "Y"
      break
    else prompt('want to play again? Y/N')
    end
  end
  return answer
end

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
prompt(rules)

rounds_mess = <<-MSG
How many rounds would you like to play?
      1) single round
      3) best of 3
      5) best of 5
      7) best of 7
MSG

sel_weapon = <<-MSG 
select your weapon:
      R) Rock
      P) Paper
      S) Scissors
MSG

loop do #MAIN LOOP sets rounds
  prompt(rounds_mess) # asks number of rounds to play
  rounds = rounds_verify(rounds) # verifies rounds
  round_counter = 0 #tracks rounds played
  win_lose = 0 # when > 0 wins, when < 0 loses

  weapon_hash = {'R' => 'Rock', 'P' => 'Paper', 'S' => 'Scissors'}
  weapon_array = ['Rock', 'Paper', 'Scissors']
  prompt("OK #{name} let's play #{rounds} rounds! FIGHT!!!")
  loop do # ALL ROUNDS LOOP results best of #{rounds}
    loop do # ROUND LOOP results 1 round breaks when round_counter == rounds
      prompt(sel_weapon) #asks R P S
      weapon = weapon_verify(weapon) # verifies weapon select
      user_weapon = weapon_hash[weapon] # sets user weapon
      comp_weapon = weapon_array.sample # sets comp weapon
      round_puts(user_weapon, comp_weapon, name, round_counter) # puts round results
      round_counter += 1 #adds 1 to round counter
      win_lose = win_lose_counter(user_weapon, comp_weapon, win_lose) 
      #tracks wins/loses
      if round_counter == rounds 
        break
      else
        puts "Get ready for the round #{round_counter + 1}!"
      end 
    end # ROUND LOOP end
    player_wins = <<-MSG
    #{name} has WON! Computer hangs his head in shame. 
    Give Computer a chance to redeem himself?!"
    ENTER: Y/N 
    MSG

    player_loses = <<-MSG
    Computer has DEFEATED #{name}. You want some more punk?
    ENTER: Y/N
    MSG
    if win_lose > 0
      puts player_wins
      break
    else 
      puts player_loses
      break
    end
  end # ALL ROUNDS LOOP end
  play_again = y_n_verify(play_again)
  if play_again == 'N'
    break
  end 
end # MAIN LOOP end

header("Thanks for playing Rock, Paper, Scissors!")