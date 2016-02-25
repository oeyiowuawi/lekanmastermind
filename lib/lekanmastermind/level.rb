require_relative 'play_mode'
module Lekanmastermind
  class Level
    def initialize(message)
      @messages = message
      @user_level = ''
    end

    def select_level
      @messages.select_level_message
      loop do
        @user_level = gets.chomp
        userlevel_process
      end
    end

    def userlevel_process
      case @user_level.downcase
      when 'b', 'beginner' then Lekanmastermind::PlayMode.new(@messages, @user_level.downcase).select_mode
      when 'i', 'intermediate' then Lekanmastermind::PlayMode.new(@messages, @user_level.downcase).select_mode
      when 'a', 'advanced' then Lekanmastermind::PlayMode.new(@messages, @user_level.downcase).select_mode
      when 'q', 'quit' then end_game
      else @messages.error_input
      end
    end

    def end_game
      @messages.goodbye
      system(exit)
    end
  end
end
