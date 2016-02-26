require 'spec_helper'

describe Lekanmastermind::Level do
  subject(:level) {Lekanmastermind::Level.new}

  describe '#new' do
  it 'creates an empty input string' do
    expect(level.user_level).to eq('')
  end
  end


  describe "user_level_process(user_level)" do
    it {should respond_to(:user_level_process)}
  end

  context "select_level" do
   it {should respond_to(:select_level)}
  end

  context "end_game" do
   it {should respond_to(:end_game)}
  end
end
