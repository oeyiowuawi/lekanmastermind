require 'yaml'
module Lekanmastermind
  class FileHandler
    def writer(player, time, chance, level)
      player_result = PlayerResult.new(
        player.name, player.guess, time, chance, level)
      File.open('scores.yaml', 'a') do |file|
        file.write(YAML.dump(player_result))
      end
    end

    def print_top_scores(level)
      if top_ten(level)
        top_ten(level).each_with_index { |player, index|  "#{index + 1} #{player}" }
      else
         'No Records yet!!'
      end
    end

    def top_ten(level)
      if File.file?('scores.yaml')
        scores = YAML.load_stream(File.open('scores.yaml','r')).select do |player|
          player.level == level
        end
        scores.sort do |player1, player2|
          by_guess = player1.time <=> player2.time
          by_guess == 0 ? player1.chances <=> player2.chances : by_guess
        end[0...10]
      end
    end
  end
end
