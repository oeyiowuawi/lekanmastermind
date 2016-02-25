module Lekanmastermind
  class Players
    attr_accessor :name, :guess
    def initialize(name)
      @name = name
      @history = []
    end

    def save_guess(guess, exact_numb, partial_numb)
      result = "#{exact_numb} exacts, #{partial_numb} partials"
      @history << [guess, result]
    end

    def show_history
      if !@history.empty?
        @history.each { |guess, result| puts "#{guess} -- #{result}" }
      else
        puts 'You have no guess history'
      end
    end
  end
end
