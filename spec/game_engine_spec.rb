require 'spec_helper'
describe Lekanmastermind::GameEngine do
subject { Lekanmastermind::GameEngine.new('rrby', message) }
let(:message) {Lekanmastermind::Messages.new}
let(:player) { Lekanmastermind::Players.new('lekan') }


  describe '#print_history' do
    it 'prints a message when History is empty' do
      allow(player).to receive(:history).and_return([])
      expect(subject.print_history(player)).to eq("No history right now")
    end
  end

  describe '#won?' do
    it 'returns true when player gets the correct sequence' do
      allow(player).to receive(:guess).and_return('rrby')
      expect(subject.won?(player)).to eq(true)
    end
  end

  describe '#not_letters'do
    it{expect(subject.not_letters?("1bcd")).to eq(true)}
  end

  describe '#cheat' do
    it{ expect(subject.cheat).to eq('rrby') }
  end
  describe '#combined_guesses' do
    it do
      allow(player).to receive(:guess).and_return('rbyb')
      expect(subject.combined_guesses(player)).to eq([['r','r'],['r','b'],['b','y'],['y','b']])
    end
  end

  describe '#process_guess' do
    let(:chances) {4}
    it do
      allow(subject).to receive(:combined_guesses).and_return(nil)
      allow(player).to receive(:guess).and_return('rbyb')
      allow(subject).to receive(:exacts).and_return(nil)
      allow(subject).to receive(:partials).and_return(nil)
      allow(player).to receive(:save_guess).and_return(nil)
      allow(message).to receive(:guess_process_message).and_return(nil)
      expect(subject.process_guess(player,chances)).to eq(nil)
    end

    describe '#exacts' do
      let(:combined_guesses) {[['r','r'],['r','b'],['b','y'],['y','b']]}
      it do
        expect(subject.exacts(combined_guesses)).to eq(1)
      end
    end
    describe '#partials' do
      let(:combined_guesses) {[['r','r'],['r','b'],['b','y'],['y','b']]}
      it do
        expect(subject.partials(combined_guesses)).to eq(2)
      end
    end
    describe '#input_length_check' do
      context 'short input' do
        let(:guess) {'rby'}
        it{ expect(subject.input_length_check(guess)).to include("guess is shorter")}
      end
      context 'long input' do
        let(:guess) {'rbyyy'}
        it{ expect(subject.input_length_check(guess)).to include("guess is longer")}
      end
    end
    describe '#invalid_play' do
      it do
        allow(subject).to receive(:not_letters?).and_return(false)
        allow(subject).to receive(:validate_number_of_characters).and_return(true)
        expect(subject.invalid_play(player)).to eq(false)
      end
    end
    describe '#comp_number_characters' do
      it{ expect(subject.comp_number_characters).to eq(4)}
    end
    describe '#validate_number_of_characters' do
      let(:guess) {'rbyo'}
      it {expect(subject.validate_number_of_characters(guess)).to eq(true)}
    end
  end

end
