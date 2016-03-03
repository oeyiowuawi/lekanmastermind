require 'spec_helper'
describe Lekanmastermind::GameEngine do
let(:player1) { Lekanmastermind::Players.new('lekan') }
let(:two_players) { true }
  describe '#game_menu' do
    it "begins game" do
      allow(subject).to receive(:puts).and_return(nil)
      allow(subject).to receive(:gets).and_return('play')
      @game_level = :beginner
      @mode = 'single'
      allow(subject).to receive(:init_player).and_return(nil)
      allow(subject).to receive(:load_mode).and_return(nil)
      allow(subject).to receive(:begin_game).and_return(nil)
      expect(subject.game_menu).to eq(nil)
    end
  end
=begin
  describe '#player_input(player)' do
    it { should respond_to(:player_input) }
    it "accepts player valid input" do
      STDIN.stub(:noecho).and_return('rrrr')
      allow(subject).to receive(:check_options).and_return(nil)
      expect(subject.player_input(player1)).to eq(nil)
    end
  end
=end
  describe '#check_options(player)' do
    it { should respond_to(:check_options) }
    it "prints out cheat" do
      allow(subject).to receive(:computer_sequence).and_return('rrbo')
      allow(player1).to receive(:guess).and_return('c')
      allow(subject).to receive(:puts).and_return('rrbo')
      expect(subject.check_options(player1)).to eq('rrbo')
    end
    it "quits the game" do
      allow(player1).to receive(:guess).and_return('q')
      allow(subject).to receive(:game_exit).and_return(nil)
      expect(subject.check_options(player1)).to eq(nil)
    end
    it "prints Hitory" do
      allow(player1).to receive(:guess).and_return('H')
      allow(subject).to receive(:print_history).and_return(nil)
      expect(subject.check_options(player1)).to eq(nil)
    end
    it "prints the appropriate error message depending on the length of the input" do
      allow(player1).to receive(:guess).and_return('z')
      allow(subject).to receive(:input_length_check).and_return(nil)
      expect(subject.check_options(player1)).to eq(nil)
    end
  end
  describe '#player_check(chances)' do
    let(:chances) {3}
    it { should respond_to(:player_check) }
    it "checks players guesses" do
      allow(subject).to receive(:winning_player).and_return(nil)
      expect(subject.player_check(chances)).to eq(nil)
    end
  end
  describe '#winning_player(player, chances)' do
    let(:chances) {2}
    it { should respond_to(:winning_player) }
    it 'checks if a player wins' do
      allow(subject).to receive(:player_input).and_return('rrby')
      allow(subject).to receive(:won?).and_return(true)
      allow(subject).to receive(:congratulation).and_return(nil)
      expect(subject.winning_player(player1, chances)).to eq(nil)
    end
    it "process a player's guess" do
      allow(subject).to receive(:player_input).and_return('rrby')
      allow(subject).to receive(:won?).and_return(false)
      allow(subject).to receive(:process_guess).and_return(nil)
      expect(subject.winning_player(player1, chances)).to eq(nil)
    end
  end
=begin
  describe '#process_guess(player, chances)?' do
    let(:chances) {5}
    let(:player) {Lekanmastermind::Players.new('lekan')}
    let(:computer_sequence) {'rrbo'}
    it { should respond_to(:process_guess) }
    it "should process the computer guess and the player guess" do
      allow(player).to receive(:guess).and_return('rryo')
      allow(subject).to receive(:puts).and_return(nil)
      require 'pry'; binding.pry
      expect(subject.process_guess(player,5)).to eq(nil)
    end
  end
=end
  describe '#exacts(combined_guesses)' do
    let(:combined_guesses) {[['r','r'],["b","b"],['r','y'],['y','b']]}
    it { should respond_to(:exacts) }
    it "returns 2 as exact matches" do
      expect(subject.exacts(combined_guesses)).to eq(2)
    end
  end
  describe '#partials(combined_guesses)' do
    let(:combined_guesses) {[['r','r'],["b","b"],['r','y'],['y','b']]}
    it { should respond_to(:partials) }
    it "returns 1 as partial match" do
      expect(subject.partials(combined_guesses)).to eq(1)
    end
  end

  describe '#calculate_partials(computer_guess, player_guess, partial_match)' do
    it { should respond_to(:calculate_partials) }
  end

end
