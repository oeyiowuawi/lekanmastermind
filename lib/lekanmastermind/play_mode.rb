require_relative 'game'
module Lekanmastermind
  class PlayMode
    def initialize(message, level)
      @message = message
      @level = level
    end

    def select_mode
      @message.select_play
      loop do
        @player_mode = gets.chomp
        process_mode
      end
    end

    def process_mode
      case @player_mode.downcase
      when 's', 'single' then Game.new(@message, @level, @player_mode).init_player
      when 't', 'two' then Game.new(@message, @level, @player_mode).init_player
      when 'q', 'quit' then end_game
      else @message.error_input
      end
    end

    def end_game
      @message.goodbye
      system(exit)
    end
  end

end
