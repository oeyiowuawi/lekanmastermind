module Lekanmastermind
  module GameMethods
    include Lekanmastermind::Messages
    def yes_or_no?
      loop do
        input = gets.chomp
        case input.downcase
        when 'y', 'yes' then return true
        when 'no', 'n' then return false
        else error_input_message
        end
      end
    end

    def replay
      replay_option_message
      yes_or_no? ? game_menu : game_exit
    end

    def game_exit
      goodbye_message
      system(exit)
    end

    def out_of_chance
      out_of_chance_msg
      replay
    end

    def input_length_check(guess)
      character_count = computer_sequence.length
      if guess.length > character_count
        puts "Your guess is longer than the required length(#{character_count})"
      elsif guess.length < computer_sequence.length
        puts "Your guess is shorter than the required length(#{character_count})"
      end
    end

=begin
    def print_history(player)
      player.show_history
    end

    def won?(player)
      player.guess == computer_sequence
    end
    def cheat
      puts computer_sequence
    end
=end
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
