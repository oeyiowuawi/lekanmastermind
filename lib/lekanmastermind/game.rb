require_relative 'player'
require_relative 'logic'
module Lekanmastermind
  class Game
    def initialize(messages, level, play_mode)
      @message = messages
      @level = level
      @play_mode = play_mode
      @player1 = nil
      @player2 = nil
    end

    def init_player
      @message.prompt_for_player1_name
      @player_name = gets.chomp
      @player1 = Players.new(@player_name)
      init_two_players if two_player?
      input_handler = Lekanmastermind::Logic.new(@message, @player1, @player2, two_player?, @level)
      input_handler.begin_game
    end

    def init_two_players
      @message.prompt_for_player2_name
      @player2_name = gets.chomp
      @player2 = Players.new(@player2_name)
    end

    def two_player?
      @play_mode == 't' || @play_mode == 'two'
    end
  end

end
