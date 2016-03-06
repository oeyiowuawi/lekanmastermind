module Lekanmastermind
  class Computer
    attr_accessor :number_of_colors, :number_of_character
    def initialize(level)
      @number_of_colors = level[1]
      @number_of_character = level[0]
    end

    def colours_for_level
      colors = %w(Red Blue Green Yellow Orange Indigo Violet Cyan Purple)
      level_color =|| colors.shuffle[0...@number_of_colors]

    end

    def generate_color_index
      color_index = []
      @number_of_character.times do
        color_index << Random.new.rand(@number_of_colors)
      end
      color_index
    end

    def computer_guess
      computer_color = ''
      generate_color_index.each do |index|
        computer_color << colours_for_level[index][0]
      end
      computer_color.downcase
    end
  end
end
