require 'spec_helper'

describe Lekanmastermind::Logic do
  subject(:logic) {Lekanmastermind::Logic.new(player1, player2, mode, level)}
  let(:player1)  {Lekanmastermind::Players.new('lekan')}
  let(:player2)  {Lekanmastermind::Players.new('lateef')}
  let(:mode) {"two"}
  let(:level) {'b'}

  describe '#player_input(player)' do
    it {should respond_to(:player_input)}
  end

  describe '#input_length_check(guess)' do
    it {should respond_to(:input_length_check)}
  end

  describe '#player_input(player)' do
    it {should respond_to(:player_input)}
  end
  describe '#check_options(player)' do
    it {should respond_to(:check_options)}
  end
  describe '#invalid_play(player)' do

    it {should respond_to(:invalid_play)}
  end
  describe '#not_letters?(guess)' do
    it {should respond_to(:not_letters?)}
  end
  describe '#comp_number_characters' do
    it {should respond_to(:comp_number_characters)}
  end
  describe '#validate_number_of_characters(guess)' do
    it {should respond_to(:validate_number_of_characters)}
  end
  describe '#print_history(player)' do
    it {should respond_to(:print_history)}
  end
  describe '#won?(player)' do
    it {should respond_to(:won?)}
  end
  describe '#quit' do
    it {should respond_to(:quit)}
  end
  describe '#cheat' do
    it {should respond_to(:cheat)}
  end
  describe '#begin_game' do
    it {should respond_to(:begin_game)}
  end
  describe '#player_check(chances)' do
    it {should respond_to(:player_check)}
  end
  describe '#winning_player(player, chances)' do
    it {should respond_to(:winning_player)}
  end
  describe '#out_of_chance' do
    it {should respond_to(:out_of_chance)}
  end
  describe '#game_exit' do
    it {should respond_to(:game_exit)}
  end
  describe '#congratulation(chances, player)' do
    it {should respond_to(:congratulation)}
  end
  describe '#replay' do
    it {should respond_to(:replay)}
  end
  describe '#yes_or_no?' do
    it {should respond_to(:yes_or_no?)}
  end
  describe '#process_guess(player, chances)?' do
    it {should respond_to(:process_guess)}
  end
  describe '#exacts(combined_guesses)' do
    it {should respond_to(:exacts)}
  end
  describe '#partials(combined_guesses)' do
    it {should respond_to(:partials)}
  end
  describe '#calculate_partials(computer_guess, player_guess, partial_match)' do
    it {should respond_to(:calculate_partials)}
  end



end
