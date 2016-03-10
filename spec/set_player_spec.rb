require 'spec_helper'

describe SetPlayer do
  subject {SetPlayer.new(message)}
  let(:message) {Lekanmastermind::Messages.new}
  describe '#player_collection' do
    it do
      allow(subject).to receive(:puts).and_return(nil)
      allow(subject).to receive(:gets).and_return('2')
      allow(subject).to receive(:check_input).and_return(false,true)
      allow(subject).to receive(:generate_players).and_return(nil)
      expect(subject.player_collection).to eq(nil)
    end
  end
  describe '#check_input' do
     it { expect(subject.check_input('2')).to eq(true)}
  end
  describe '#generate_players' do
    it do
      allow(subject).to receive(:puts).and_return(nil)
      allow(subject).to receive(:gets).and_return('lekan')
     expect(subject.generate_players('2')).to be_a Array
   end
  end

end
