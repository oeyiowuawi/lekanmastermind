
require 'spec_helper'

describe Lekanmastermind::Interface do
  subject(:interface) { Lekanmastermind::Interface.new }

  context 'create a new instance of a class' do
    it { expect(interface).to be_a(Lekanmastermind::Interface) }
  end

  context '#start_game' do
    it { should respond_to(:start_game) }
  end

  context '#player_option(input)' do
    it { should respond_to(:player_option) }
  end
end
