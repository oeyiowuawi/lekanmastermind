require 'spec_helper'

describe Lekanmastermind::Game do
  let(:game) { Lekanmastermind::Game.new(level, playmode) }
  #let(:logic) { Lekanmastermind::Logic.new }
  let(:level) { 'a' }
  let(:playmode) { 't' }
=begin

  context 'init_player' do
    #let(:level) {'b'}
    #it { should respond_to(:init_player) }
    it "initializes player" do
      allow(game).to receive(:gets).and_return('lekan')
      allow(game).to receive(:two_player?).and_return(false)
      #@player1 = Lekanmastermind::Players.new(@player_name)
      # allow(game).to receive(:init_two_players).and_return(Lekanmastermind::Players.new('lateef'))
      expect(game.init_player).to eq nil
    end
  end
=end
  context 'init_two_players' do
     #it { should respond_to(:init_two_players) }

     it 'returns an instance of a player class' do
       allow(game).to receive(:gets).and_return("lateef")
       expect(game.init_two_players).to be_a(Lekanmastermind::Players)
     end

   end
   context 'two_player?' do
       let(:playmode) {"t"}
     #it { should respond_to(:two_player?) }
     it "returns true for two players" do
       expect(game.two_player?).to eq(true)
     end
   end
end
