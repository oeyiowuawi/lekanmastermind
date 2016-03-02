
module Lekanmastermind
  class PlayMode
    include Messages
    attr_accessor :level
    def initialize(level)
      @level = level
    end

    # def select_mode
    #   select_play_message
    #   loop do
    #     player_mode = gets.chomp
    #     process_mode(player_mode.downcase)
    #   end
    # end

    def process_mode#(player_mode)
      select_play_message
      player_mode = gets.chomp
      case player_mode
      when 's', 'single' then Game.new(@level, player_mode).init_player
      when 't', 'two' then Game.new(@level, player_mode).init_player
      when 'q', 'quit' then end_game
      else
        error_input_message
        process_mode
      end
    end

    def end_game
      goodbye_message
      system(exit)
    end
  end
end
