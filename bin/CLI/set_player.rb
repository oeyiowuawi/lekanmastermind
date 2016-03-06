require 'lekanmastermind/player'
class SetPlayer
  def initialize(message)
    @message = message
  end
  def player_collection
    loop do
      puts @message.number_of_players
      @number_of_players = gets.chomp
      break if check_input(@number_of_players)
      @message.error_input
    end
    generate_players(@number_of_players)

  end

  def check_input(input)
    true if  input =~ /\A[-+]?[0-9]*\.?[0-9]+\Z/
  end

  def generate_players(number_of_players)
    number_of_players = number_of_players.to_i
    players = []
    (0..(number_of_players - 1)).each do |i|
      puts "Enter your name player#{(i + 1).to_s}"
      input = gets.chomp
      players << Lekanmastermind::Players.new(input)
    end
    players
  end

end
