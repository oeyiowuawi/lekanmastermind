require 'extra_methods'
require 'lib/lekanmastermind'
require_relative 'logic'
class Cli
  include ExtraMethods
  def initialize
    @message = Lekanmastermind::Messages.new
    @logic = Logic.new(@message)
    @file_handler = FileHandler.new
  end

  def welcome
    puts @message.welcome
    input = gets.chomp
    process_input(input)
  end

  def process_input
    case input
    when 'q', 'quit' then game_exit
    when 'p', 'play'  then play
    when 'i', 'instruction' then load_instructions
    when 't', 'top' then top_ten
    else
      puts @message.error_input
      welcome
    end
  end

  def load_instructions
    puts @message.instructions
    loop do
      response = gets.chomp.downcase
      break  if response == 'menu'
      puts @message.error_input
    end
    welcome
  end

  def play
    level = select_level
    @logic = Logic.new(@message, level)
    @logic.start_game
  end

  def select_level
    puts @message.select_level
    input = gets.chomp
    game_exit if input == 'q' || input == 'quit'
    process_level(input)
  end

 def process_level(input)
   if supported_level.include? input
     [input, supported_level[input]]
   else
     puts @message.error_input
     select_level
   end
 end


 def supported_level
   {
      'beginner' => [4,4],
      'advanced' => [8,6],
      'intermediate' => [6,5]
   }
 end


  def top_ten
    level = select_level
    puts @file_handler.print_top_scores(level)
    loop do
      puts go_to_menu
      response = gets.chomp.downcase
      break if response == 'menu'
    end
      game_menu
  end
end
