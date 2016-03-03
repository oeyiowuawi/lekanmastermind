require 'spec_helper'
describe Lekanmastermind::GameMethods do
  before :each  do
      @game_engine = Lekanmastermind::GameEngine.new
      @player1 = Lekanmastermind::Players.new('lateef')
    end
  describe '#yes_or_no?' do
    it "returns true when the user enters y" do
      allow(@game_engine).to receive(:gets).and_return('y')
      expect(@game_engine.yes_or_no?).to eq(true)
    end
    it "returns false when the user enters n" do
      allow(@game_engine).to receive(:gets).and_return('n')
      expect(@game_engine.yes_or_no?).to eq(false)
    end
  end
  describe '#replay' do
    it "replays the game if user enters yes" do
      allow(@game_engine).to receive(:puts).and_return('Do you want to play again? Press Y or N')
      allow(@game_engine).to receive(:gets).and_return('n')
      allow(@game_engine).to receive(:game_exit).and_return(nil)
      expect(@game_engine.replay).to eq(nil)
    end
  end
  describe '#game_exit' do
    it "should  quit the game" do
      allow(@game_engine).to receive(:puts).and_return(nil)
      expect{@game_engine.game_exit}.to raise_error SystemExit
    end
  end

  describe '#out_of_chance' do
    it "prints the out of chance message" do
      allow(@game_engine).to receive(:puts).and_return("GAME OVER!! You're out of Trials!")
      allow(@game_engine).to receive(:replay).and_return(nil)
      expect(@game_engine.out_of_chance).to eq(nil)
    end
  end
  describe '#input_length_check(guess)' do
    let(:guess) {"bbryy"}
    it "returns the message length too long when user enters the wrong number of charater" do
      allow(@game_engine).to receive(:computer_sequence).and_return("bbry")
      allow(@game_engine).to receive(:puts).and_return("Your guess is longer than the required length(4)")
      expect(@game_engine.input_length_check("bbryy")).to eq("Your guess is longer than the required length(4)")
    end
  end
  describe '#input_length_check(guess)' do
    let(:guess) {"bbr"}
    it "returns the message length too short when user enters the wrong number of charater" do
      allow(@game_engine).to receive(:computer_sequence).and_return("bbry")
      allow(@game_engine).to receive(:puts).and_return("Your guess is shorter than the required length(4)")
      expect(@game_engine.input_length_check("bbr")).to eq("Your guess is shorter than the required length(4)")
    end
  end
  describe '#print_history(player)' do
    it "prints the player History" do
      allow(@player1).to receive(:show_history).and_return('rrbo -- 2 eaxcts, 1 partials')
      expect(@game_engine.print_history(@player1)).to eq('rrbo -- 2 eaxcts, 1 partials')
    end
  end
  describe '#won?(player)' do
    it "should return true if the player guess is the same with the computer guess" do
      allow(@player1).to receive(:guess).and_return('rrrr')
      allow(@game_engine).to receive(:computer_sequence).and_return('rrrr')
      expect(@game_engine.won?(@player1)).to eq(true)
    end
  end
  describe '#cheat' do
    it "should return  the computer guess" do
      allow(@game_engine).to receive(:computer_sequence).and_return('rrrr')
      allow(@game_engine).to receive(:puts).and_return('rrrr')
      expect(@game_engine.cheat).to eq('rrrr')
    end
  end
  describe '#invalid_play(player)' do
    it "returns true for invalid input" do
      allow(@player1).to receive(:guess).and_return('1ty')
      expect(@game_engine.invalid_play(@player1)).to eq(true)
    end
  end

  describe '#not_letters?(guess)' do
    let(:guess) {"1rrb"}
    it " returns true if the guess contains non alphabetic character" do
      expect(@game_engine.not_letters?(guess)).to eq(true)
    end
  end

  describe '#comp_number_characters' do
    it "returns the number of character" do
      allow(@game_engine).to receive(:computer_sequence).and_return('RBGY')
      expect(@game_engine.comp_number_characters).to eq(4)
    end
  end
  describe '#validate_number_of_characters(guess)' do
    let(:guess) {'rrby'}
    it "return true for the correct number of guess" do
      allow(@game_engine).to receive(:comp_number_characters).and_return(4)
      expect(@game_engine.validate_number_of_characters(guess)).to eq(true)
    end
  end

end
