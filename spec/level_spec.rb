require 'spec_helper'

describe Lekanmastermind::Level do
  subject(:level) { Lekanmastermind::Level.new }

  describe '#new' do
    it 'creates an empty input string' do
      expect(level.user_level).to eq('')
    end
  end

  describe 'user_level_process(user_level)' do
    let(:user_level) {'q'}
    it { should respond_to(:user_level_process) }
    it "quits the game when user enters 'q'" do
      allow(level).to receive(:puts).and_return(nil)
      allow(level).to receive(:end_game).and_return(nil)
      expect(level.user_level_process('q')).to eq(nil)
  end
end
 describe 'user_level_process(user_level)' do
   let(:user_level) {'b'}
=begin
    it "sends the player to the mode class" do
      allow(level).to receive(:gets).and_return('b')
      expect(level.user_level_process('b')).to be_a(PlayMode.new(user_level))
    end
=end
end
  context 'select_level' do
    it { should respond_to(:select_level) }
=begin
    it "should select the level and pass the parameter to the appropriate class " do
      allow(level).to receive(:puts).and_return()
      allow(level).to receive(:puts).and_return(nil)
      allow(level).to receive(:gets).and_return('c')
      allow(level).to receive(:user_level_process).and_return(nil)
      expect(level.select_level).to eq(nil)
    end
=end
  end

  context 'end_game' do
    it { should respond_to(:end_game) }
    it "should  quit the game" do
      allow(level).to receive(:puts).and_return(nil)
      expect{level.end_game}.to raise_error SystemExit
    end
  end
=begin
  context 'wrong_entry' do
    it { should respond_to(:select_level) }
    it "read wrong input message" do
      require "pry"; binding.pry
      allow(level).to receive(:gets).and_return("c")
      expect(level.select_level).to include "invalid letter"
    end
  end
=end
end
