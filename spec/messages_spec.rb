require 'spec_helper'
describe Lekanmastermind::Messages do
 describe '#welcome' do
    it { expect(subject.welcome).to be_a String}
  end
 describe '#instruction' do
    it { expect(subject.instructions).to include 'Enter your level'}
 end
 describe '#error_input' do
    it { expect(subject.error_input).to include 'invalid letter'}
 end
 describe '#select_level' do
    it { expect(subject.select_level).to include 'level of difficulty'}
 end
 describe '#number_of_players' do
    it { expect(subject.instructions).to include 'number of players'}
 end
 describe '#level_welcome' do
   let(:comp_handler) { Lekanmastermind::Computer.new({num_of_colors: 4, num_of_char: 4})}
   let(:level) {'beginner'}
    it  do
      allow(comp_handler).to receive(:number_of_character).and_return(4)
      allow(comp_handler).to receive(:level_colors).and_return(['Red','blue','green','yellow'])
      expect(subject.level_welcome(level,comp_handler)).to be_a String
    end
 end
 describe '#go_to_menu' do
    it { expect(subject.go_to_menu).to include 'back to the menu'}
 end
 describe '#congratulation' do
   let(:player) { Lekanmastermind::Players.new('Lekan')}
   let(:trial) {2}
   let(:time) {123456}
   it  do
     allow(player).to receive(:guess).and_return("rrgb")
     expect(subject.congratulation(player,trial, time)).to include 'Congratulation Lekan'
   end
 end
 describe '#save_record' do
    it { expect(subject.save_record).to include 'save your record'}
 end
 describe '#view_top_scores' do
    it { expect(subject.view_top_scores).to include 'view top scores'}
 end
 describe '#replay_option' do
    it { expect(subject.replay_option).to include 'want to play again'}
 end
 describe '#guess_process_message' do
    it { expect(subject.guess_process_message('rrby',2,1,5)).to include 'has 2 exacts and 1 partials'}
 end
 describe '#top_ten' do
    it { expect(subject.top_ten).to include 'TOP TEN'}
 end
 describe '#out_of_chance' do
    it { expect(subject.out_of_chance).to include 'GAME OVER'}
 end
 describe '#goodbye' do
    it { expect(subject.goodbye).to include 'See you soon'}
 end

end
