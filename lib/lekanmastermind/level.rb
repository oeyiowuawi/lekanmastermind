
module Lekanmastermind
  class Level
    include Messages
    attr_accessor :user_level
    def initialize
      #@messages = message
      @user_level = ''
    end

    def select_level
      select_level_message
      loop do
        @user_level = gets.chomp.downcase
        user_level_process(@user_level)
      end
    end

    def user_level_process(user_level)
      #binding.pry
      case user_level
      when 'b', 'beginner' then Lekanmastermind::PlayMode.new(user_level).select_mode
      when 'i', 'intermediate' then Lekanmastermind::PlayMode.new(user_level).select_mode
      when 'a', 'advanced' then Lekanmastermind::PlayMode.new(user_level).select_mode
      when 'q', 'quit' then end_game
      else error_input_message
      end
    end

    #def

    def end_game
      goodbye_message
      system(exit)
    end
  end
end
