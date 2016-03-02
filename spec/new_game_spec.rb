
require 'spec_helper'

describe Lekanmastermind::Interface do
  subject(:interface) { Lekanmastermind::Interface.new }
let(:level){Lekanmastermind::Level.new}
  context 'create a new instance of a class' do
    it { expect(interface).to be_a(Lekanmastermind::Interface) }
  end

  context '#start_game' do
    it { should respond_to(:start_game) }
    #it " starts game"
  end
=begin
  context '#player_option(input)' do
    let(:input) {'p'}
    it { should respond_to(:player_option) }
    it "should go to level" do
      allow(level).to receive(:select_level).and_return(nil)
      expect(interface.player_option(input)).to eq(nil)
    end
  end
=end
  context '#quit' do
    it "fghjk" do
    allow(interface).to receive(:puts).and_return(nil)
    #allow(interface).to receive(:gets)
    expect{interface.quit}.to raise_error SystemExit
      end
  end
end
