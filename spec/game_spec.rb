require 'spec_helper'

describe Lekanmastermind::Game do
  subject(:game) {Lekanmastermind::Game.new(level,playmode)}
  let(:level) {'a'}
  let(:playmode) {'t'}

  context "init_player" do
   it {should respond_to(:init_player)}
  end
  context "init_two_players" do
   it {should respond_to(:init_two_players)}
  end
  context "two_player?" do
   it {should respond_to(:two_player?)}
  end
end
