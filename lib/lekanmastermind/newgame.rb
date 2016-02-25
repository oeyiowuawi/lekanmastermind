require_relative 'level'
require_relative 'messages'
require_relative 'logic'
module Lekanmastermind
  class Interface
    def initialize
      @input = ''
      @messages = Messages.new
    end

    def start_game
      @messages.welcome_msg
      loop do
        player_option
      end
    end

    def player_option
      @input = gets.chomp.downcase
      case @input
      when 'p' then Level.new(@messages).select_level
      when 'i' then @messages.instructions
      when 'q' then quit
      else @messages.error_input
      end
    end

    def quit
      @messages.goodbye
      system(exit)
    end
  end

end
