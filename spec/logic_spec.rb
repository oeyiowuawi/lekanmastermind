require 'spec_helper'

describe Lekanmastermind::Logic do
  subject(:logic) { Lekanmastermind::Logic.new(player1, player2, mode, level) }
  let(:player1)  { Lekanmastermind::Players.new('lekan') }
  let(:player2)  { Lekanmastermind::Players.new('lateef') }
  let(:file)  { Lekanmastermind::FileHandler.new }
  let(:mode) { true }
  let(:level) { 'b' }

  describe '#player_input(player)' do
    it { should respond_to(:player_input) }
    it "accepts player valid input" do
      STDIN.stub(:noecho).and_return('rrrr')
      allow(logic).to receive(:check_options).and_return(nil)
      expect(logic.player_input(player1)).to eq(nil)
    end

  end

  describe '#input_length_check(guess)' do
    let(:guess) {"bbryy"}
    it { should respond_to(:input_length_check) }
    it "returns the message length too long when user enters the wrong number of charater" do
      allow(logic).to receive(:computer_sequence).and_return("bbry")
      allow(logic).to receive(:puts).and_return("Your guess is longer than the required length(4)")
      expect(logic.input_length_check("bbryy")).to eq("Your guess is longer than the required length(4)")
    end
  end
  describe '#input_length_check(guess)' do
    let(:guess) {"bbr"}
    it { should respond_to(:input_length_check) }
    it "returns the message length too short when user enters the wrong number of charater" do
      allow(logic).to receive(:computer_sequence).and_return("bbry")
      allow(logic).to receive(:puts).and_return("Your guess is shorter than the required length(4)")
      expect(logic.input_length_check("bbr")).to eq("Your guess is shorter than the required length(4)")
    end
  end

  describe '#player_input(player)' do
    it { should respond_to(:player_input) }
  end
  describe '#check_options(player)' do
    it { should respond_to(:check_options) }
    it "prints out cheat" do
      allow(logic).to receive(:computer_sequence).and_return('rrbo')
      allow(player1).to receive(:guess).and_return('c')
      allow(logic).to receive(:puts).and_return('rrbo')
      expect(logic.check_options(player1)).to eq('rrbo')
    end
    it "quits the game" do
      allow(player1).to receive(:guess).and_return('q')
      allow(logic).to receive(:game_exit).and_return(nil)
      expect(logic.check_options(player1)).to eq(nil)
    end
    it "prints Hitory" do
      allow(player1).to receive(:guess).and_return('H')
      allow(logic).to receive(:print_history).and_return(nil)
      expect(logic.check_options(player1)).to eq(nil)
    end
    it "prints the appropriate error message depending on the length of the input" do
      allow(player1).to receive(:guess).and_return('z')
      allow(logic).to receive(:input_length_check).and_return(nil)
      expect(logic.check_options(player1)).to eq(nil)
    end
  end
  describe '#invalid_play(player)' do
    it { should respond_to(:invalid_play) }
    it "returns true for invalid input" do
      allow(player1).to receive(:guess).and_return('1ty')
      expect(logic.invalid_play(player1)).to eq(true)
    end
  end
  describe '#not_letters?(guess)' do
    let(:guess) {"1rrb"}
    it { should respond_to(:not_letters?) }
    it " returns true if the guess contains non alphabetic character" do
      expect(logic.not_letters?(guess)).to eq(true)
    end
  end
  describe '#comp_number_characters' do
    it { should respond_to(:comp_number_characters) }
    it "returns the number of character" do
      allow(logic).to receive(:computer_sequence).and_return('RBGY')
      expect(logic.comp_number_characters).to eq(4)
    end
  end
  describe '#validate_number_of_characters(guess)' do
    let(:guess) {'rrby'}
    it { should respond_to(:validate_number_of_characters) }
    it "return true for the correct number of guess" do
      allow(logic).to receive(:comp_number_characters).and_return(4)
      expect(logic.validate_number_of_characters(guess)).to eq(true)
    end
  end
  describe '#print_history(player)' do
    it { should respond_to(:print_history) }
    it "prints the player History" do
      allow(player1).to receive(:show_history).and_return('rrbo -- 2 eaxcts, 1 partials')
      expect(logic.print_history(player1)).to eq('rrbo -- 2 eaxcts, 1 partials')
    end
  end
  describe '#won?(player)' do
    it { should respond_to(:won?) }
    it "should return true if the player guess is the same with the computer guess" do
      allow(player1).to receive(:guess).and_return('rrrr')
      allow(logic).to receive(:computer_sequence).and_return('rrrr')
      expect(logic.won?(player1)).to eq(true)
    end
  end

  describe '#cheat' do
    it { should respond_to(:cheat) }
    it "should return  the computer guess" do
      allow(logic).to receive(:computer_sequence).and_return('rrrr')
      allow(logic).to receive(:puts).and_return('rrrr')
      expect(logic.cheat).to eq('rrrr')
    end
  end
  describe '#begin_game' do
    #let(chances) {13}
    it { should respond_to(:begin_game) }
=begin
    it "quits the game when the chance is greater than 12" do
      allow(logic).to receive(:puts).and_return(nil)
      allow(logic).to receive(:chances).and_return(12)
      allow(logic).to receive(:player_check).and_return(nil)
      expect(logic.begin_game).to include('GAME OVER!!')
    end
=end
  end
  describe '#player_check(chances)' do
    let(:chances) {3}
    it { should respond_to(:player_check) }
    it "checks players guesses" do
      allow(logic).to receive(:winning_player).and_return(nil)
      expect(logic.player_check(chances)).to eq(nil)
    end
  end
  describe '#winning_player(player, chances)' do
    let(:chances) {2}
    it { should respond_to(:winning_player) }
    it 'checks if a player wins' do
      allow(logic).to receive(:player_input).and_return('rrby')
      allow(logic).to receive(:won?).and_return(true)
      allow(logic).to receive(:congratulation).and_return(nil)
      expect(logic.winning_player(player1, chances)).to eq(nil)
    end
    it "process a player's guess" do
      allow(logic).to receive(:player_input).and_return('rrby')
      allow(logic).to receive(:won?).and_return(false)
      allow(logic).to receive(:process_guess).and_return(nil)
      expect(logic.winning_player(player1, chances)).to eq(nil)
    end
  end
  describe '#out_of_chance' do
    it { should respond_to(:out_of_chance) }
    it "prints the out of chance message" do
      allow(logic).to receive(:puts).and_return("GAME OVER!! You're out of Trials!")
      allow(logic).to receive(:replay).and_return(nil)
      expect(logic.out_of_chance).to eq(nil)
    end
  end

  describe '#game_exit' do
    it { should respond_to(:game_exit) }
    it "should  quit the game" do
      allow(logic).to receive(:puts).and_return(nil)
      expect{logic.game_exit}.to raise_error SystemExit
    end
  end

  describe '#congratulation(chances, player)' do
     let(:chances) {5}
    # let(:start_time) {1456853898}
    # let(:end_time) {1456854156}
    # let(:time_elapsed) {258}
    it { should respond_to(:congratulation) }
=begin
    it "should congratulate player and then print top score and exit"do
    require 'pry'; binding.pry
      allow(logic).to receive(:congratulatory_message).and_return(nil)
      allow(logic).to receive(:yes_or_no?).and_return(true)
      allow(file).to receive(:writer).and_return(nil)
      allow(file).to receive(:print_top_scores).and_return(nil)
      allow(logic).to receive(:replay).and_return(nil)
      expect(logic.congratulation(chances, player1)).to eq(nil)
    end
=end
  end

  describe '#replay' do
    it { should respond_to(:replay) }
    it "replays the game if user enters yes" do
      allow(logic).to receive(:puts).and_return('Do you want to play again? Press Y or N')
      allow(logic).to receive(:gets).and_return('n')
      allow(logic).to receive(:game_exit).and_return(nil)
      expect(logic.replay).to eq(nil)
    end

  end

  describe '#yes_or_no?' do
    it { should respond_to(:yes_or_no?) }
    it "returns true when the user enters y" do
      allow(logic).to receive(:gets).and_return('y')
      expect(logic.yes_or_no?).to eq(true)
    end
    it "returns false when the user enters n" do
      allow(logic).to receive(:gets).and_return('n')
      expect(logic.yes_or_no?).to eq(false)
    end
  end
  describe '#process_guess(player, chances)?' do
    let(:chances) {5}
    let(:player) {Lekanmastermind::Players.new('lekan')}
    let(:computer_sequence) {'rrbo'}
    it { should respond_to(:process_guess) }
    it "should process the computer guess and the player guess" do
      allow(player).to receive(:guess).and_return('rryo')
      allow(logic).to receive(:puts).and_return(nil)
      expect(logic.process_guess(player,5)).to eq(nil)
    end
  end
  describe '#exacts(combined_guesses)' do
    let(:combined_guesses) {[['r','r'],["b","b"],['r','y'],['y','b']]}
    it { should respond_to(:exacts) }
    it "returns 2 as exact matches" do
      expect(logic.exacts(combined_guesses)).to eq(2)
    end
  end
  describe '#partials(combined_guesses)' do
    let(:combined_guesses) {[['r','r'],["b","b"],['r','y'],['y','b']]}
    it { should respond_to(:partials) }
    it "returns 1 as partial match" do
      expect(logic.partials(combined_guesses)).to eq(1)
    end
  end
  describe '#calculate_partials(computer_guess, player_guess, partial_match)' do
    it { should respond_to(:calculate_partials) }
  end
end
