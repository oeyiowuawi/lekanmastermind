require 'spec_helper'

describe Lekanmastermind::Computer do


  subject { Lekanmastermind::Computer.new(num_of_colors: 6,num_of_char: 8) }
  describe '#level_colors' do
    it{ expect(subject.level_colors.length).to eq(6) }
  end

  describe '#random_colour_char' do
    it { expect(subject.random_colour_char.length).to eq(1) }
    it { expect(subject.random_colour_char).to be_a String }
  end

  describe '#computer_guess' do
    it { expect(subject.computer_guess).to be_a String }
    it { expect(subject.computer_guess.length).to eq(8) }
  end
end
