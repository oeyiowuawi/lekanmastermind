
# This class controls all the logic in the game
# it checks the guesses againt computer's and return the appropriate response
require_relative 'game_methods'
require_relative 'game_initializer'
module Lekanmastermind
  class GameEngine
    attr_accessor :computer_sequence
    def initialize(sequence,message)
      #computer_handler = Computer.new(level)
      @message = message
      @computer_sequence = sequence
    end
=begin
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

=end


=begin
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

    def check_options(player)
      case player.guess
      when 'c', 'C' then cheat
      when 'q', 'Q' then game_exit
      when 'h', 'H' then print_history(player)
      else input_length_check(player.guess)
      end
    end
=end

    def print_history(player)
      player.history.empty? ? "No history right now" : player.history
    end

    def won?(player)
      player.guess == computer_sequence
    end

    def cheat
       computer_sequence
    end
    def process_guess(player, chances)
      guess = player.guess.split('')
      comp = computer_sequence.split('')
      combined_guesses = comp.zip(guess)
      exact_numb = exacts(combined_guesses)
      partial_numb = partials(combined_guesses)
      player.save_guess(guess.join, exact_numb, partial_numb)
      @message.guess_process_message(guess.join, exact_numb,
                                      partial_numb, chances)
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
=begin
    def game_exit
      goodbye_message
      system(exit)
    end

    def out_of_chance
      out_of_chance_msg
      replay
    end
=end
    def input_length_check(guess)
      character_count = computer_sequence.length
      if guess.length > character_count
         "Your guess is longer than the required length(#{character_count})"
      elsif guess.length < computer_sequence.length
         "Your guess is shorter than the required length(#{character_count})"
      end
    end

    def invalid_play(player)
      not_letters?(player.guess) || !validate_number_of_characters(player.guess)
    end

    def not_letters?(guess)
      trimmed_guess = guess.strip
      true if /[^a-z]/ =~ trimmed_guess
    end

    def comp_number_characters
      computer_sequence.length
    end

    def validate_number_of_characters(guess)
      guess.length == comp_number_characters
    end

  end
end
