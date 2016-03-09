require 'spec_helper'
describe Lekanmastermind::FileHandler do
  subject(:file_handle) {Lekanmastermind::FileHandler.new}
  context '#writer' do
    #let(:player) {Lekanmastermind::Players.new('lekan')}
    let(:name) {'Lekan'}
    let(:guess) {'RRBYIO'}
    let(:time) {146}
    let(:chance) {2}
    let(:level) {'intermediate'}
    let(:player_result) {Lekanmastermind::PlayerResult.new(name, guess, time, chance,level)}
    it "should save to yaml" do
      #require 'pry'; binding.pry
      YAML.stub(:writer).with('whatever.yaml').and_return(YAML.dump(player_result))
      expect(file_handle.writer(name, guess,time, chance, level)).to eq(114) # number of bytes that write method returns
    end
  end
=begin
  context '#top_ten' do
    let(:yaml_text) {}
      it 'should load the scores file' do
        YAML.stub(:top_ten).with('whatever.yml').and_return(YAML.load_stream(yaml_text))
        expect(file_handle.top_ten).to eq(nil)
      end
    end
=end


end
