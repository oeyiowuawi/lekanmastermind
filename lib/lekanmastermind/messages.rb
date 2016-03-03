module Lekanmastermind
  module Messages
    def welcome_msg
      puts 'Welcome to mastermind. Would you like to (p)lay, read the (i)nstructions or (q)uit?'

      puts <<-EOS
               *************************************************
               *           Welcome to mastermind               *
               *                                               *
               *       Press p(lay) to start a new game        *
               *       Press (i)nstruction to load a saved game*
               *       Press (q)uit to quit the game at anytime*
               *                                               *
               *************************************************
          EOS
      print '>'
    end

    def instructions
    puts <<-EOS
               **************************************************
               *      This is MASTERMIND game v0.1.0            *
               *            By Olalekan Eyiowuawi               *
               *      Enjoy and expect the next version         *
               *      Press q at anytime to quit the game.      *
               *      Enter your level and play mode            *
               *   b - beginner, i - intermediate, a - advanced *
               *   To view guess history, enter h at any time   *
               *      when the game starts                      *
               *      Press Menu to go back to the menu.        *
               **************************************************
        EOS
    end

    def error_input_message
    puts <<-EOS
                ************************************************************************
                * You've entered an invalid letter. Read the instruction and try again *
                ************************************************************************
        EOS
    end

    def select_level_message
    puts <<-EOS
                *********************************************************
                *       Select Your preferred level of difficulty       *
                *          Enter b  for beginner                        *
                *          Enter i for intermediate                     *
                *          Enter a  for advance                         *
                *********************************************************
          EOS
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
          You can choose #{comp_handler.number_of_color_and_character[0]}
          colors from the following colors: #{comp_handler.colours_for_level}
          To enter a sequence,
          Enter just the first letters of your  color sequence"

    end

    def congratulatory_message(player, trial, time)
      puts <<-EOS
                  *********************************************************
                         Congratulation #{player.name}!!
                     You guessed the correct sequence '#{player.guess}'
                     in #{trial} trial(s) over #{time / 3600}hrs
                            #{time / 60} min #{time % 60} secs."
                  *********************************************************
            EOS
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
      puts <<-EOS
                *************************************************
                *       Select the mode you want.               *
                *       (s)ingle for single mode                *
                *       (m)ultiplayer for two                   *
                *************************************************
           EOS
    end

    def out_of_chance_msg
      puts "GAME OVER!! You're out of Trials!"
    end

    def goodbye_message
      puts 'Thanks for playing Master Mind. See you soon'
    end
  end
end
