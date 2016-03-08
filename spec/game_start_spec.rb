require 'spec_helper'
describe Cli do

  context "@message" do
    let(:message) { subject.instance_variable_get(:@message) }
    it { expect(message).to be_an_instance_of Lekanmastermind::Messages }
  end
  context "@file_handler" do
    let(:file_handler) { subject.instance_variable_get(:@file_handler) }
    it { expect(file_handler).to be_an_instance_of Lekanmastermind::FileHandler }
  end
  describe '#welcome' do
    it do
      allow(subject).to receive(:puts).and_return(nil)
      allow(subject).to receive(:gets).and_return('play')
      allow(subject).to receive(:process_input).and_return(nil)
      expect(subject.welcome).to eq(nil)
    end
  end

  describe '#process_input' do

    context 'correct input' do
      it do
        input = "p"
        allow(subject).to receive(:play).and_return(true)
        expect(subject.process_input(input)).to eq(true)
      end
    end
    context 'wrong input' do
      let(:input) {"w"}
      it do
        allow(subject).to receive(:puts).and_return(nil)
        allow(subject).to receive(:welcome).and_return(nil)
        expect(subject.process_input(input)).to eq(nil)
      end
    end
  end

  describe '#game_option'do
    it{ expect(subject.game_option).to be_a Hash}
  end

  describe 'load_instructions' do
    it do
      allow(subject).to receive(:puts).and_return(nil)
      allow(subject).to receive(:gets).and_return('menu')
      allow(subject).to receive(:welcome).and_return(nil)
      expect(subject.load_instructions).to eq(nil)
    end
  end

  describe '#play' do
    let(:logic) {Logic.new(@message, [4,4])}
    it do
      allow(subject).to receive(:select_level).and_return([4,4])
      allow(Logic).to receive(:new).and_return(nil)
      allow(logic).to receive(:start_game).and_return(nil)
      expect(subject.play).to eq(nil)
    end
  end

  describe '#select_level' do
    it do
      allow(subject).to receive(:puts).and_return(nil)
      allow(subject).to receive(:gets).and_return('advanced')
      allow(subject).to receive(:process_level).and_return(nil)
      expect(subject.select_level).to eq(nil)
    end
  end

  describe '#process_level' do
    context 'correct input' do
      it do
        input = "advanced"
        allow(subject).to receive(:play).and_return(true)
        expect(subject.process_level(input)).to eq(['advanced',[8,6]])
      end
    end
    context 'wrong input' do
      let(:input) {"Hard"}
      it do
        allow(subject).to receive(:puts).and_return(nil)
        allow(subject).to receive(:select_level).and_return(nil)
        expect(subject.process_level(input)).to eq(nil)
      end
    end
  end
  describe '#supported_level'do
    it{ expect(subject.game_option).to be_a Hash}
  end

  describe '#top_ten' do
    it do
      allow(subject).to receive(:puts).and_return(nil)
      allow(subject).to receive(:select_level).and_return([6,5])
      allow(@file_handler).to receive(:print_top_scores).and_return(nil)
      allow(subject).to receive(:gets).and_return('menu')
      allow(subject).to receive(:welcome).and_return(nil)
      expect(subject.top_ten).to eq(nil)
    end
  end

end
