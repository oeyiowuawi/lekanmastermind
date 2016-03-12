module Lekanmastermind
  class PlayerResult
    attr_reader :name, :guess, :time, :chances, :level

    def initialize(name, guess, time, chances, level)
      @name = name
      @guess = guess
      @time = time
      @chances = chances
      @level = level
    end

    def to_s
      "#{name} solved '#{guess.upcase}' in #{chances} guess(es) over #{time / 60}m#{time}s"
    end
  end
end
