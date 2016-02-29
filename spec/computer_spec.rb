require 'spec_helper'

describe Lekanmastermind::Computer do
  subject(:computer) { Lekanmastermind::Computer.new(level) }
  let(:level) { 'b' }
  # before :each do
  #   @computer = Computer.new
  # end
  describe '#number_of_color_and_character' do
    it 'returns a [4,4] for the beginner level' do
      expect(computer.number_of_color_and_character).to eq([4, 4])
    end
  end

  describe '#number_of_color_and_character' do
    let(:level) { 'beginner' }
    it 'returns a [4,4] for the beginner level' do
      expect(computer.number_of_color_and_character).to eq([4, 4])
    end
  end

  describe '#number_of_color_and_character' do
    let(:level) { 'i' }
    it 'returns a [6,5] for the intermediate level' do
      expect(computer.number_of_color_and_character).to eq([6, 5])
    end
  end

  describe '#number_of_color_and_character' do
    let(:level) { 'intermediate' }
    it 'returns a [6,5] for the intermediate level' do
      expect(computer.number_of_color_and_character).to eq([6, 5])
    end
  end

  describe '#number_of_color_and_character' do
    let(:level) { 'a' }
    it 'returns a [8,6] for the intermediate level' do
      expect(computer.number_of_color_and_character).to eq([8, 6])
    end
  end

  describe '#number_of_color_and_character' do
    let(:level) { 'advanced' }
    it 'returns a [6,5] for the advanced level' do
      expect(computer.number_of_color_and_character).to eq([8, 6])
    end
  end

  describe '#generate_color_index' do
    it 'returns an array of number with length of 4 for beginner level' do
      allow(computer).to receive(:number_of_color_and_character).and_return([4, 4])
      expect(computer.generate_color_index.length).to eq(4)
    end
  end
  describe '#generate_color_index' do
    it 'returns an array of number with length of 6 for intermediate level' do
      allow(computer).to receive(:number_of_color_and_character).and_return([6, 5])
      expect(computer.generate_color_index.length).to eq(6)
    end
  end
  describe '#generate_color_index' do
    it 'returns an array of number with length of 8 for advanced level' do
      allow(computer).to receive(:number_of_color_and_character).and_return([8, 6])
      expect(computer.generate_color_index.length).to eq(8)
    end
  end
  describe '#computer_guess' do
    it 'returns String' do
      expect(computer.computer_guess).to be_a(String)
    end
  end
end
