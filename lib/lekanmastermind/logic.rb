require 'i/o'
require_relative 'computer'
require_relative 'filemanager'

module Lekanmastermind
  class Logic
    attr_reader :computer_sequence
    def initialize(message, player1, player2, mode, level)
      @message = message
      @level = level
      @player1 = player1
      @player2 = player2
      @two_players = mode
      @comp_handler = Computer.new(@level)
      @computer_sequence = @comp_handler.computer_guess
    end

    def player_input(player)
      begin
        @message.enter_input_guess(player.name)
        player.guess = @two_players ? STDIN.noecho(&:gets).chomp : gets.chomp
        check_options(player)
      end while invalid_play(player)
    end

    def input_length_check(guess)
      character_count = computer_sequence.length
      if guess.length > character_count
        puts "Your guess is longer than the required length(#{character_count})"
      elsif guess.length < computer_sequence.length
        puts "Your guess is shorter than the required length(#{character_count})"
      end
    end

    def check_options(player)
      case player.guess
      when 'c', 'C' then cheat
      when 'q', 'Q' then quit
      when 'h', 'H' then print_history(player)
      else input_length_check(player.guess)
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

    def print_history(player)
      player.show_history
    end

    def won?(player)
      player.guess == computer_sequence
    end

    def quit
      @message.goodbye
      system(exit)
    end

    def cheat
      puts computer_sequence
    end

    def begin_game
      @message.level_welcome_message(@comp_handler)
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
      winning_player(@player2, chances) if @two_players
    end

    def winning_player(player, chances)
      player_input(player)
      if won?(player)
        congratulation(chances, player)
      else
        process_guess(player, chances)
      end
    end

    def out_of_chance
      @message.out_of_chance_msg
      replay
    end

    def game_exit
      @message.goodbye
      system(exit)
    end

    def congratulation(chances, player)
      end_time = Time.now
      time_elapsed = (end_time - @start_time).to_i
      @message.congratulatory_message(player, chances, time_elapsed)
      if yes_or_no?
        FileHandler.new.writer(player.name, player.guess, time_elapsed, chances)
      end
      FileHandler.new.print_top_scores(@message)
      replay
    end

    def replay
      @message.replay_option
      yes_or_no? ? Interface.new.start_game : game_exit
    end

    def yes_or_no?
      loop do
        input = gets.chomp
        case input.downcase
        when 'y', 'yes' then return true
        when 'no', 'n' then return false
        else @message.error_input
        end
      end
    end

    def process_guess(player, chances)
      guess = player.guess.split('')
      comp = computer_sequence.split('')
      combined_guesses = comp.zip(guess)
      exact_numb = exacts(combined_guesses)
      partial_numb = partials(combined_guesses)
      player.save_guess(guess.join, exact_numb, partial_numb)
      @message.guess_process(guess.join, exact_numb, partial_numb, chances)
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