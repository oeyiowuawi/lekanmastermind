require 'yaml'
require_relative 'store_player_result'
module Lekanmastermind
  class FileHandler
    def writer(name, guess, time, chance)
      player_result = StorePlayerResult.new(name, guess, time, chance)
      File.open('highscores.yaml', 'a') do |file|
        file.write(YAML.dump(player_result))
      end
    end

    def print_top_scores(message)
      top_ten = top_ten
      if !top_ten.nil?
        message.top_ten
        top_ten.each_with_index { |player, index| puts "#{index + 1} #{player}" }
      else
        puts 'No TOP Score right now'
      end
    end

    def top_ten
      YAML.load_stream(File.open('highscores.yaml')).sort do |player1, player2|
        by_guess = player1.time <=> player2.time
        by_guess == 0 ? player1.chances <=> player2.chances : by_guess
      end[0...10] if File.file?('highscores.yaml')
    end
  end
end
