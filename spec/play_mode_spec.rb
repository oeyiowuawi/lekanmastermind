require 'spec_helper'

describe Lekanmastermind::PlayMode do
  subject(:play_mode) {Lekanmastermind::PlayMode.new(level)}
  let(:level) {"b"}

  describe '#new' do
  it 'creates an empty input string' do
    expect(play_mode.level).to eq('b')
  end
  end

  describe '#new' do
    let(:level) {"i"}
  it 'creates an empty input string' do
    expect(play_mode.level).to eq('i')
  end
  end
  describe '#new' do
    let(:level) {"a"}
  it 'creates an empty input string' do
    expect(play_mode.level).to eq('a')
  end
  end

  describe "select_mode" do
    it {should respond_to(:select_mode)}
  end

  context "process_mode(player_mode)" do
   it {should respond_to(:process_mode)}
  end

  context "end_game" do
   it {should respond_to(:end_game)}
  end
end
