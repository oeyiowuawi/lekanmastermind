
# This class controls all the logic in the game
# it checks the guesses againt computer's and return the appropriate response
require_relative 'game_methods'
require_relative 'game_initializer'
module Lekanmastermind
  class GameEngine
    include Lekanmastermind::Messages
    include Lekanmastermind::GameInitializer
    include Lekanmastermind::GameMethods
    attr_accessor :computer_sequence

    def game_menu
      welcome_msg
      action = gets.chomp
      @game_level = player_action(action)
      @mode = load_mode
      init_player
      begin_game
    end

    def player_input(player)
      loop do
        enter_input_guess(player.name)
        player.guess = two_players? ? STDIN.noecho(&:gets).chomp : gets.chomp
        check_options(player)
        break unless invalid_play(player)
      end
    end

    def check_options(player)
      case player.guess
      when 'c', 'C' then cheat
      when 'q', 'Q' then game_exit
      when 'h', 'H' then print_history(player)
      else input_length_check(player.guess)
      end
    end

    def begin_game
      begin_game_initialize
      @start_time = Time.now
      chances = 1
      while chances < 13
        player_check(chances)
        chances += 1
      end
      out_of_chance
    end

    def player_check(chances)
      winning_player(@player1, chances)
      winning_player(@player2, chances) if two_players?
    end

    def winning_player(player, chances)
      player_input(player)
      if won?(player)
        congratulation(chances, player)
      else
        process_guess(player, chances)
      end
    end

    def congratulation(chances, player)
      end_time = Time.now
      time_elapsed = (end_time - @start_time).to_i
      congratulatory_message(player, chances, time_elapsed)
      if yes_or_no?
        @file_handler.writer(player.name, player.guess, time_elapsed, chances, @game_level)
      end
      @file_handler.print_top_scores(@game_level)
      replay
    end

    def process_guess(player, chances)
      guess = player.guess.split('')
      comp = computer_sequence.split('')
      combined_guesses = comp.zip(guess)
      exact_numb = exacts(combined_guesses)
      partial_numb = partials(combined_guesses)
      player.save_guess(guess.join, exact_numb, partial_numb)
      guess_process_message(guess.join, exact_numb, partial_numb, chances)
    end

    def exacts(combined_guesses)
      combined_guesses.count { |guess| guess[0] == guess[1] }
    end

    def partials(combined_guesses)
      combined_guesses.select! { |guess| guess[0] != guess[1] }
      computer_guess, player_guess = combined_guesses.transpose
      partial_match = []
      calculate_partials(computer_guess, player_guess, partial_match)
    end

    def calculate_partials(computer_guess, player_guess, partial_match)
      player_guess.each do |a|
        if computer_guess.include? a
          computer_guess.delete_at(computer_guess.index(a))
          partial_match << a
        end
      end
      partial_match.size
    end
  end
end
