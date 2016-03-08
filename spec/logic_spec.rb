require 'spec_helper'
describe Logic do
  subject {Logic.new(message,['beginner',[4,4]])}
  let(:message) {Lekanmastermind::Messages.new}
  let(:set_player) {SetPlayer.new(message)}
  describe '#start_game' do
    #let(:players_count) {2}
    it do
      allow(set_player).to receive(:player_collection).and_return(nil)
      allow(subject).to receive(:puts).and_return(nil)
      allow(subject).to receive(:begin_game).and_return(nil)
      expect(subject.start_game).to eq(nil)
    end
  end

end
