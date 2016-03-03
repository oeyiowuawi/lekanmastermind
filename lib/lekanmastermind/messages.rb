module Lekanmastermind
  module Messages
    def welcome_msg
      puts 'Welcome to mastermind. Would you like to (p)lay, read the (i)nstructions or (q)uit?'
      print '>'
    end

    def instructions
      puts 'You know waht to do. You just want me to fucking teeyu. enter menu to go back to the menu'
    end

    def error_input_message
      puts "You've entered an invalid letter. Read the instruction and try again "
    end

    def select_level_message
      puts "Select Your preferred level of difficulty. Enter b  for beginner, i
      for intermediate or a  for advance"
    end

    def prompt_for_player1_name_message
      puts 'Enter your name'
    end

    def prompt_for_player2_name_message
      puts 'Player two,Enter your name'
    end

    def enter_input_guess(player_name)
      puts "Enter your guess #{player_name}"
    end

    def level_welcome_message(comp_handler)
      puts "You are playing the #{comp_handler.level} level.
      You can choose #{comp_handler.number_of_color_and_character[0]} colors from
      the following colors: #{comp_handler.colours_for_level} To enter a sequence,
       Enter just the first letters of your  color sequence"
    end

    def congratulatory_message(player, trial, time)
      puts "Congratulation #{player.name}!! You guessed the correct
      sequence '#{player.guess}' in #{trial} trial(s) over #{time / 3600}hrs
      #{time / 60} min #{time % 60} secs."
      puts 'Do you want to save your record? y/n'
    end

    def replay_option_message
      puts 'Do you want to play again? Press Y or N'
    end

    def guess_process_message(guess, exact, partial, chances)
      puts "'#{guess.upcase}' has #{exact} exacts and #{partial} partials"
      puts "#{12 - chances} chances left"
    end

    def top_ten_message
      puts '========= TOP TEN ========='
    end

    def select_play_message
      puts 'Select the mode you want. (s)ingle for single mode or (t)wo for two
       player mode'
    end

    def out_of_chance_msg
      puts "GAME OVER!! You're out of Trials!"
    end

    def goodbye_message
      puts 'Thanks for playing Master Mind. See you soon'
    end
  end
end
