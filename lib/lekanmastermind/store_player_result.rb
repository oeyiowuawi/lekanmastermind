module Lekanmastermind
  class StorePlayerResult
    attr_reader :name
    attr_reader :guess
    attr_reader :time
    attr_reader :chances

    def initialize(name, guess, time, chances)
      @name = name
      @guess = guess
      @time = time
      @chances = chances
    end

    def to_s
      "#{name} solved '#{guess.upcase}' in #{chances} guess(es) over #{time / 60}m#{time}s"
    end
  end

end
