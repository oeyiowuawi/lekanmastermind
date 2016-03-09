require 'spec_helper'

describe Lekanmastermind::PlayerResult do
  subject { Lekanmastermind::PlayerResult.new(name, guess, time, chances, level) }
  let(:name) { 'lekan' }
  let(:guess) { 'RRGOBY' }
  let(:time) { 123 }
  let(:chances) { 6 }
  let(:level) {'intermediate'}

  describe '#new' do
    it{ expect(subject.name).to be_a(String) }
    it { expect(subject.guess).to be_a(String) }
    it { expect(subject.time).to be_a(Fixnum) }
    it { expect(subject.chances).to be_a(Fixnum) }
    it { expect(subject.level).to be_a String }
  end

  describe 'to_s' do
    it { expect(subject.to_s).to be_a(String) }
  end
end
