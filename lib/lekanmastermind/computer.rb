module Lekanmastermind
  class Computer
    attr_accessor :level
    def initialize(level)
      @level = level
      @colors = %w(Red Blue Green Yellow Orange Indigo)
      @level_color = @colors.shuffle[0...number_of_color_and_character[1]]
    end

    def colours_for_level
      @level_color
    end

    def number_of_color_and_character
      case @level
      when 'b', 'beginner' then [4, 4]
      when 'i', 'intermediate' then [6, 5]
      when 'a', 'advanced' then [8, 6]
      end
    end

    def generate_color_index
      color_index = []
      number_of_color_and_character[0].times do
        color_index << Random.new.rand(number_of_color_and_character[1])
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
