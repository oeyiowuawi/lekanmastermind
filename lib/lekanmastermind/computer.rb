module Lekanmastermind
  class Computer
    attr_accessor :level
    def initialize(level)
      @level = level
      @colors = %w(Red Blue Green Yellow Orange Indigo)
      @level_color = @colors.shuffle[0...number_of_color_and_character[1]]
    end
end
