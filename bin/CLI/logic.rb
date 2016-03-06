require 'lib/Lekanmastermind/computer'
require 'lib/Lekanmastermind/game_engine'
class Logic
  def initialize(message, level)
    @player_level = level[0]
    @message = message
    @set_player = SetPlayer.new(message)
    @comp_handler = Lekanmastermind::Computer.new(level[1])
    @game_engine = Lekanmastermind::GameEngine.new(@comp_handler.computer_guess,
                                                  message)
    @file_handler = Lekanmastermind::FileHandler.new
  end

  def start_game
    player_collection = @setplayer.player_collection
    puts level_welcome(@player_level, @comp_handler)
  end

  def begin_game(level_details, players)
    chances = 1
    start_time = (Time.now).to_i
    while chances < 13
      players.each do |player|
        check_input(player)
        check_guess(player, chances, start_time)
      end
      chances += 1
    end
    out_of_chance
  end

  def check_guess(player, chances,start_time)
    if @game_engine.won?(player)
      end_time = (Time.now).to_i
      time_elapsed = (end_time - start_time)
      puts @message.congratulation(player, chances, time_elapsed)
      file_operations(player, chances, time_elapsed)
    else
      puts @game_engine.process_guess(player, chances)
    end
  end

  def file_operations(player, chances, time_elapsed)
      puts @message.save_record
      reply = gets.chomp
      if yes_or_no?
        @file_handler.writer(player, time_elapsed, chances, @game_level)
      end
      puts @message.view_top_scores
      puts @file_handler.print_top_scores(@player_level) if yes_or_no?
      replay
  end

  def check_input(player)
    loop do
      puts "Enter your guess #{player.name}"
      player.guess = gets.chomp
      check_options(player)
      break unless @logic.invalid_play(player)
    end
  end

  def check_options(player)
    case player.guess
    when 'c', 'C' then puts @game_engine.cheat
    when 'q', 'Q' then game_exit
    when 'h', 'H' then puts @game_engine.print_history(player)
    else puts @game_engine.input_length_check(player.guess)
    end
  end

  def yes_or_no?
    loop do
      input = gets.chomp
      case input.downcase
      when 'y', 'yes' then return true
      when 'no', 'n' then return false
      else @message.error_input_message
      end
    end
  end

  def replay
    puts @message.replay_option
    yes_or_no? ? Cli.new.welcome : game_exit
  end
  def out_of_chance
    @message.out_of_chance_msg
    replay
  end

end
