require 'spec_helper'
describe Lekanmastermind::FileHandler do
  subject(:file_handle) {Lekanmastermind::FileHandler.new}
  context '#writer' do
    let(:name) {'Lekan'}
    let(:guess) {'RRBYIO'}
    let(:time) {146}
    let(:chance) {2}
    let(:level) {'intermediate'}
    let(:player_result) {Lekanmastermind::PlayerResult.new(name, guess, time, chance,level)}
    it "should save to yaml" do
      YAML.stub(:writer).with('whatever.yaml').and_return(YAML.dump(player_result))
      expect(file_handle.writer(name, guess,time, chance, level)).to eq(114) # number of bytes that write method returns
    end
  end



end
