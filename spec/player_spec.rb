
require 'spec_helper'

describe Lekanmastermind::Players do
  subject(:player) {Lekanmastermind::Players.new(name)}
  let(:name) {'lekan'}

  describe '#new' do
  it 'return name which is a string' do
    expect(player.name).to be_a(String)
  end
  end


  describe '#save_guess(guess, exact_numb, partial_numb)' do
    it {should respond_to(:save_guess)}
  end

  describe "show_history" do
    it {should respond_to(:show_history)}
  end

  describe "#save_guess" do
    let(:guess) {"RRBY"}
    let(:exact_numb) {2}
    let(:partial_numb) {2}
    it "returns an array with the formatted guess" do
      expect(player.save_guess(guess,exact_numb,partial_numb)).to be_a(Array)
    end
    it 'checks guess as a string' do
      expect(player.save_guess(guess,exact_numb,partial_numb)).to eq([["RRBY", "2 exacts, 2 partials"]])
    end
  end




end
