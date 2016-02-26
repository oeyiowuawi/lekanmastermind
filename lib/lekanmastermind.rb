require "lekanmastermind/version"
require 'lekanmastermind/messages'
require 'lekanmastermind/newgame'
require 'lekanmastermind/level'
require 'lekanmastermind/logic'
require 'lekanmastermind/play_mode'
require 'lekanmastermind/game'
require 'lekanmastermind/player'
require 'io/console'
require 'lekanmastermind/computer'
require 'lekanmastermind/filemanager'
require 'yaml'
require 'lekanmastermind/store_player_result'

module Lekanmastermind
  class Mastermind
    def initialize
      Lekanmastermind::Interface.new.start_game
    end
  end
end
