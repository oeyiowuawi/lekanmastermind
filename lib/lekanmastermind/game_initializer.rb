require_relative 'messages'
require_relative 'game_methods'
require_relative 'player'

module Lekanmastermind
  module GameInitializer
    #include Lekanmastermind::Messages
    include Lekanmastermind::GameMethods
    attr_reader :mode
    def begin_game_initialize
      computer_handler = Computer.new(@game_level)
      @computer_sequence = computer_handler.computer_guess
      @file_handler = Lekanmastermind::FileHandler.new
      level_welcome_message(computer_handler)
    end

    def player_action(select_action)
      if supported_actions.include? select_action
        send(supported_actions[select_action])
      elsif select_action == 'q' || select_action == 'quit'
        game_exit
      else
        error_input_message
        game_menu
      end
    end

    def supported_actions
      {
        'p' => :select_level,
        'i' => :load_instructions,
        'instruction' => :load_instructions,
        'play' => :select_level,
        't' => :top_ten,
        'top' => :top_ten
      }
    end

    def top_ten
      level = select_level
      FileHandler.new.print_top_scores(level)
      go_to_menu
      response = gets.chomp.downcase
      game_menu if response == 'menu'
      game_exit
    end

    def load_instructions
      instructions
      response = gets.chomp.downcase
      game_menu if response == 'menu'
      game_exit
    end

    def select_level
      select_level_message
      level = gets.chomp.downcase
      game_level(level)
    end

    def game_level(level)
      case level
      when 'a', 'advanced' then :advanced
      when 'b', 'beginner' then :beginner
      when 'i', 'intermediate' then :intermediate
      when 'q', 'quit' then game_exit
      else
        error_input_message
        select_level
      end
    end

    def load_mode
      select_play_message
      mode = gets.chomp.downcase
      case mode
      when 's', 'single' then 'single'
      when 'm', 'multiplayer' then 'multiplayer'
      when 'q', 'quit' then game_exit
      else
        error_input_message
        load_mode
      end
    end
    def init_player
      prompt_for_player1_name_message
      player_name = gets.chomp
      @player1 = Players.new(player_name)
      init_two_players if two_players?
    end

    def init_two_players
      prompt_for_player2_name_message
      @player2_name = gets.chomp
      @player2 = Players.new(@player2_name)
    end

    def two_players?
      @mode == 'multiplayer'
    end
  end
end
