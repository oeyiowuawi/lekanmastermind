
# This class controls all the logic in the game
# it checks the guesses againt computer's and return the appropriate response
require_relative 'game_methods'
require_relative 'game_initializer'
module Lekanmastermind
  class GameEngine
    attr_accessor :computer_sequence
    def initialize(sequence,message)
      @message = message
      @computer_sequence = sequence
    end

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
