require 'spec_helper'

describe Lekanmastermind::PlayMode do
  subject(:play_mode) { Lekanmastermind::PlayMode.new(level) }
  let(:level) { 'b' }

  describe '#new' do
    let(:level) {'b'}
    it 'creates an empty input string' do
      expect(play_mode.level).to eq('b')
    end
  end

  describe '#new' do
    let(:level) { 'i' }
    it 'creates an empty input string' do
      expect(play_mode.level).to eq('i')
    end
  end
  describe '#new' do
    let(:level) { 'a' }
    it 'creates an empty input string' do
      expect(play_mode.level).to eq('a')
    end
  end
=begin
  describe 'select_mode' do
    it { should respond_to(:select_mode) }
    it "should allow users to select their mode " do
      allow(play_mode).to receive(:process_mode).and_return(nil)
      allow(play_mode).to receive(:puts).and_return(nil)
      allow(play_mode).to receive(:gets).and_return('t')
      expect(play_mode.select_mode).to eq(nil)
    end
  end
=end
  context 'process_mode(player_mode)' do
    let(:player_mode){'s'}
    it { should respond_to(:process_mode) }

  end

  context 'end_game' do
    it { should respond_to(:end_game) }
    it "should  quit the game" do
      allow(play_mode).to receive(:puts).and_return(nil)
      expect{play_mode.end_game}.to raise_error SystemExit
    end
  end
end
