def header(text)
  puts "=============={ #{text} }====================="
end

def prompt(text) #WORKING
  puts "==> #{text}"
end 

def name_verify(name) #WORKING
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

def greet(name) #WORKING
  puts "Hello #{name}. let's play!"
end

def rounds_verify(number) #WORKING
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

def weapon_verify(answer) # working
  loop do
  answer = gets.chomp.upcase.to_s
    if answer == 'SPOCK'
      answer = answer.byteslice(-1).to_s
    else
      answer = answer.byteslice(0).to_s
    end
  answer_array = ['R', 'P', 'S', 'L', 'K']
    if answer_array.include?(answer)
      break
    else
      prompt("Re-enter selection: R: (R)ock, P: (P)aper, S: (S)cissors, L: (L)izard, K: SpocK")
    end
  end
  return answer
end

def round_puts(user, comp, name, round_counter) # working
  if (user == "Rock" && (comp == "Scissors" || comp == "Lizard")) ||
    (user == "Paper" && (comp == "Rock" || comp == "Spock")) ||
    (user == "Scissors" && (comp == "Paper" || comp == "Lizard")) ||
    (user == "Lizard" && (comp == "Paper" || comp == "Spock")) ||
    (user == "Spock" && (comp == "Rock"  || comp == "Scissors"))
  puts "#{name} selects #{user}, computer selects #{comp}
  ==> #{name} wins Round #{round_counter + 1}!"
  elsif user == comp
    puts "You both selected #{user}. 
    ==> Round #{round_counter + 1} is a draw."
  else
    puts "#{name} selects #{user}, computer selects #{comp}
    ==> #{name} loses Round #{round_counter + 1}."
  end
end
def win_lose_counter(user, comp, win_lose) # working
  if (user == "Rock" && (comp == "Scissors" || comp == "Lizard")) ||
    (user == "Paper" && (comp == "Rock" || comp == "Spock")) ||
    (user == "Scissors" && (comp == "Paper" || comp == "Lizard")) ||
    (user == "Lizard" && (comp == "Paper" || comp == "Spock")) ||
    (user == "Spock" && (comp == "Rock"  || comp == "Scissors"))
    win_lose += 1
  elsif user == comp
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

header("Welcome to Rock, Paper, Scissors, Lizard, Spock")
puts ''

prompt('Please enter your name')
name = name_verify(name)
greet(name)

rules = <<-MSG
OK, here's how the game works:
      ==> Paper beats: Rock and Spock
      ==> Rock beats: Scissors and Lizard
      ==> Scissors beats: Paper and Lizard
      ==> Lizard beats: Spock and Paper
      ==> Spock beats: Rock and Scissors

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
      R: (R)ock
      P: (P)aper
      S: (S)cissors
      L: (L)izard
      K: Spoc(K)
MSG

loop do #MAIN LOOP sets rounds
  prompt(rounds_mess) # asks number of rounds to play
  rounds = rounds_verify(rounds) # verifies rounds
  round_counter = 0 #counts rounds played
  win_lose = 0 # when > 0 wins, when < 0 loses
  auto_win = rounds/2 + 1 # benchmark winning total before rounds end
  auto_lose = auto_win * -1 # benchmark losing total before rounds end
  weapon_hash = {'R'=> 'Rock', 'P'=> 'Paper', 'S'=> 'Scissors', 'L'=> 'Lizard', 'K'=> 'SpocK'}
  weapon_array = ['Rock', 'Paper', 'Scissors', 'Lizard', 'SpocK']
  prompt("OK #{name} let's play #{rounds} rounds! FIGHT!!!")
  loop do # ALL ROUNDS LOOP results best of #{rounds}
    loop do # ROUND LOOP results 1 round breaks when round_counter == rounds
      prompt(sel_weapon) #asks R P S L K
      weapon = weapon_verify(weapon) # verifies weapon select
      user = weapon_hash[weapon] # sets user weapon
      comp = weapon_array.sample # sets comp weapon

      round_puts(user, comp, name, round_counter) # puts round results SPACE ADDED BELOW
      round_counter += 1 #adds 1 to round counter
      win_lose = win_lose_counter(user, comp, win_lose) 
      # ^mutates win_lose +1/ -1^

      if round_counter == rounds 
        break
      elsif win_lose == auto_win || win_lose == auto_lose
        break
      else
        puts "
Get ready for Round #{round_counter + 1}!"
      end 
    end # ROUND LOOP end

player_wins = <<-MSG
#{name} has WON! Computer hangs his head in shame. 
Will you Computer a chance to redeem himself?!"

ENTER: Y/N 
MSG
player_draws = <<-MSG
#{name} and Computer have TIED. 
Shall we play again to determine the victor?

ENTER: Y/N
MSG
player_loses = <<-MSG
Computer has DEFEATED #{name}. You want some more, punk?

ENTER: Y/N
MSG

    if win_lose > 0
      puts player_wins
      break
    elsif win_lose == 0
      puts player_draws
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

header("Thanks for playing: Rock, Paper, Scissors, Lizard, SpocK!")













