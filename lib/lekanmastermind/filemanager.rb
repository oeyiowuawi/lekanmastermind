
module Lekanmastermind
  class FileHandler
    include Messages
    def writer(name, guess, time, chance)
      player_result = Lekanmastermind::StorePlayerResult.new(name, guess, time, chance)
      File.open('scores.yaml', 'a') do |file|
        file.write(YAML.dump(player_result))
      end
    end

    def print_top_scores
      if top_ten
        top_ten_message
        top_ten.each_with_index { |player, index| puts "#{index + 1} #{player}" }
      else
        puts 'No Records yet!!'
      end
    end

    def top_ten
      if File.file?('scores.yaml')
        YAML.load_stream(File.open('scores.yaml')).sort do |player1, player2|
          by_guess = player1.time <=> player2.time
          by_guess == 0 ? player1.chances <=> player2.chances : by_guess
        end[0...10]
      end
    end
  end
end
