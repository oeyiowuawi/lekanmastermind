
module Lekanmastermind
  class Interface
    include Lekanmastermind::Messages
    def initialize
      @level = Lekanmastermind::Level.new
    end

    def start_game
      welcome_msg
      loop do
        # player_option gets.chomp.downcase
        player_input = gets.chomp.downcase
        player_option(player_input)
      end
    end

    def player_option(input)
      case input
      when 'p' then @level.select_level
      when 'i' then instructions
      when 'q' then quit
      else error_input_message
      end
    end

    def quit
      goodbye_message
      system(exit)
    end
  end
end
