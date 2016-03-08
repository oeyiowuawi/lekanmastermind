module Lekanmastermind
  class Computer
    attr_reader :number_of_colors, :number_of_character, :level_colors
    def initialize(num_of_colors:, num_of_char:)
      @number_of_colors = num_of_colors
      @number_of_character = num_of_char
      colors = %w(Red Blue Green Yellow Orange Indigo Violet Cyan Purple)
      @level_colors = colors.shuffle[0...@number_of_colors]
    end

    def computer_guess
      computer_colors = ''
      number_of_character.times do
        computer_colors << random_colour_char
      end
      computer_colors.downcase
    end

    def random_colour_char
      colour_index = Random.new.rand(number_of_colors)
      @level_colors[colour_index][0]
    end
  end
end
