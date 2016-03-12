require_relative 'logic'
class Cli
  include ExtraMethods
  def initialize
    @message = Lekanmastermind::Messages.new
    @file_handler = Lekanmastermind::FileHandler.new
  end

  def welcome
    puts @message.welcome
    input = gets.chomp
    process_input(input)
  end

  def process_input(input)
    if game_option.include? input
      send(game_option[input])
    else
      puts @message.error_input
      welcome
    end
  end

  def game_option
    {
      'quit' => :game_exit, 'q' => :game_exit,
      'play' => :play, 'p' => :play,
      'instruction' => :load_instructions, 'i' => :load_instructions,
      'top' => :top_ten, 't' => :top_ten
    }
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
      'beginner' => {num_of_colors: 4, num_of_char: 4},#[4,4],
      'advanced' => {num_of_colors: 6, num_of_char: 8},#[8,6],
      'intermediate' => {num_of_colors: 5, num_of_char: 6},#[6,5]
    }
  end

  def top_ten
    level = select_level
    puts @file_handler.print_top_scores(level[0])
    loop do
      puts @message.go_to_menu
      response = gets.chomp.downcase
      break if response == 'menu'
    end
    welcome
  end
end
