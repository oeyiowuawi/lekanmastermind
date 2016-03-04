require 'spec_helper'

describe Lekanmastermind::StorePlayerResult do
  subject(:store_player_result) { Lekanmastermind::StorePlayerResult.new(name, guess, time, chances, level) }
  let(:name) { 'lekan' }
  let(:guess) { 'RRBY' }
  let(:time) { 123 }
  let(:chances) { 6 }
  let(:level) {:beginner}

  describe '#new' do
    it 'return name which is a string' do
      expect(store_player_result.name).to be_a(String)
    end
  end

  describe '#new' do
    it 'return guess which is a string' do
      expect(store_player_result.guess).to be_a(String)
    end
  end

  describe '#new' do
    it 'return time which is a Number' do
      expect(store_player_result.time).to be_a(Fixnum)
    end
  end

  describe '#new' do
    it 'return chances which is a Number' do
      expect(store_player_result.chances).to be_a(Fixnum)
    end
  end
  describe '#new' do
    it 'return chances which is a Number' do
      expect(store_player_result.level).to be_a Symbol
    end
  end

  describe 'to_s' do
    it { should respond_to(:to_s) }
  end
end
