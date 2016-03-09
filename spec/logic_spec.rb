require 'spec_helper'
describe Logic do
  subject {Logic.new(message,['beginner',{num_of_colors: 4, num_of_char: 4}])}
  let(:message) {Lekanmastermind::Messages.new}
  let(:set_player) {SetPlayer.new(message)}
  let(:player) {Lekanmastermind::Players.new('lekan')}
  let(:game_engine) {Lekanmastermind::GameEngine.new('RRBY',message)}
=begin
  describe '#start_game' do
    #let(:players_count) {2}
    it do
      allow(set_player).to receive(:player_collection).and_return(nil)
      allow(subject).to receive(:puts).and_return(nil)
      allow(subject).to receive(:begin_game).and_return(nil)
      expect(subject.start_game).to eq(nil)
    end
  end


describe '#check_input' do
  #let(:players_count)  { 2 }
  it do
    @players_count = 2
    allow(subject).to receive(:puts).and_return(nil)
    STDIN.stub(:noecho).and_return('rrrr')
    #require 'pry'; binding.pry
    allow(subject).to receive(:check_options).and_return(nil)
    allow(@game_engine).to receive(:invalid_play).and_return(false)
    expect(subject.check_input(player)).to eq(nil)
  end
end
=end

describe '#file_operations' do
  let(:time_elapsed) {120}
  let(:chances) {5}
  let(:player_level) {'beginner'}
  it do
    allow(subject).to receive(:yes_or_no?).and_return(true)
    allow(player).to receive(:guess).and_return('rrvy')
    allow(subject).to receive(:puts).and_return(nil)
    allow(subject).to receive(:show_top_score).and_return(nil)
    allow(subject).to receive(:replay).and_return(nil)
    expect(subject.file_operations(player,chances,time_elapsed)).to eq(nil)
  end

end

=begin
describe '#check_guess' do
  it do
    allow(game_engine).to receive(:won?).and_return(true)
    allow(game_engine).to receive(:process_guess).and_return(nil)
    allow(subject).to receive(:puts).and_return(nil)
    allow(subject).to receive(:file_operations).and_return(nil)
    expect(subject.check_guess(player,12,1457489567)).to eq(nil)
  end

end
=end
describe '#show_top_score' do
  it do
    allow(subject).to receive(:yes_or_no?).and_return(true)
    allow(subject).to receive(:puts).and_return(nil)
    #allow(subject).to receive(:yes_or_no?).and_return(false)
    expect(subject.show_top_score).to eq(nil)
  end

end

describe '#check_options' do
  context 'cheat' do
    it do
      allow(player).to receive(:guess).and_return('c')
      allow(player).to receive(:puts).and_return(nil)
      expect(subject.check_options(player)).to eq(nil)
    end
  end

  context 'quit' do
    it do
      allow(player).to receive(:guess).and_return('q')
      allow(subject).to receive(:game_exit).and_return(nil)
      expect(subject.check_options(player)).to eq(nil)
    end
  end
  context 'history' do
    it do
      allow(player).to receive(:guess).and_return('h')
      allow(subject).to receive(:puts).and_return(nil)
      expect(subject.check_options(player)).to eq(nil)
    end
  end
  context 'invalid input' do
    it do
      allow(player).to receive(:guess).and_return('o')
      allow(subject).to receive(:puts).and_return(nil)
      expect(subject.check_options(player)).to eq(nil)
    end
  end

end

describe '#yes_or_no' do
  context 'returns true' do
    it do
      allow(subject).to receive(:puts).and_return(nil)
      allow(subject).to receive(:gets).and_return('yes')
      expect(subject.yes_or_no?).to eq(true)
    end
  end
  context 'returns false' do
    it do
      allow(subject).to receive(:puts).and_return(nil)
      allow(subject).to receive(:gets).and_return('no')
      expect(subject.yes_or_no?).to eq(false)
    end
  end

end
describe '#replay' do
  it do
    allow(subject).to receive(:puts).and_return(nil)
    allow(subject).to receive(:game_exit).and_return(nil)
    allow(subject).to receive(:yes_or_no?).and_return(false)
    expect(subject.replay).to eq(nil)
  end

end

describe '#out_of_chance' do
  it do
    allow(subject).to receive(:puts).and_return(nil)
    allow(subject).to receive(:replay).and_return(nil)
    expect(subject.out_of_chance).to eq(nil)
  end

end

end
