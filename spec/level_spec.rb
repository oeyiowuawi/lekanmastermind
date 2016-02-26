require 'spec_helper'
require 'pry'
describe Lekanmastermind::Level do
  subject(:level) {Lekanmastermind::Level.new(message)}
  let(:message) {Lekanmastermind::Messages.new}

  describe "#user_level_process" do
    let(:user_level) {'b'}
    it "points to the player mode class with the approprate level" do
      binding.pry
      expect(level.user_level_process(user_level)).to be_a(Lekanmastermind::PlayMode)
    end
  end
end
