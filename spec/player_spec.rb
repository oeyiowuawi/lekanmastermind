
require 'spec_helper'

describe Lekanmastermind::Players do
  subject { Lekanmastermind::Players.new(name) }
  let(:name) { 'lekan' }
  let(:guess) { 'RRBY' }

  describe 'name' do
    it { expect(subject.name).to eq('lekan')}
  end

  describe '#save_guess' do

    let(:exact_numb) { 2 }
    let(:partial_numb) { 2 }
    it 'checks guess as a string' do
      expect(subject.save_guess(guess, exact_numb, partial_numb)).to eq([['RRBY', '2 exacts, 2 partials']])
    end
  end

end
