require 'spec_helper'
describe Lekanmastermind::GameInitializer do
  #let(:initializer) { Class.new.extend(Lekanmastermind::GameInitializer)}

  before :each  do
      @game_engine = Lekanmastermind::GameEngine.new
      #@player1 =
    end
  describe 'init_two_players' do
     it 'returns an instance of a player class' do
       allow(@game_engine).to receive(:gets).and_return("lateef")
       expect(@game_engine.init_two_players).to be_a(Lekanmastermind::Players)
     end
   end
   describe 'two_players?' do
       let(:mode) {'single'}
     it "returns true for two players" do
       expect(@game_engine.two_players?).to eq(false)
     end
   end
   context '#init_player' do
       let(:two_players?) {"false"}
     it "initializes single player" do
       allow(@game_engine).to receive(:gets).and_return("lateef")
       expect(@game_engine.init_player).to eq(nil)
     end
   end

   describe '#load_mode' do
     context 'single player' do
       it "returns single for single player" do
         allow(@game_engine).to receive(:puts).and_return(nil)
         allow(@game_engine).to receive(:gets).and_return("single")
         expect(@game_engine.load_mode).to eq('single')
       end
     end
     context 'multiplayer' do
       it "initializes miltiplayer player" do
         allow(@game_engine).to receive(:puts).and_return(nil)
         allow(@game_engine).to receive(:gets).and_return("multiplayer")
         expect(@game_engine.load_mode).to eq('multiplayer')
       end
     end
     context 'q' do
       it "quits the game" do
         allow(@game_engine).to receive(:puts).and_return(nil)
         allow(@game_engine).to receive(:gets).and_return("quit")
         expect{@game_engine.load_mode}.to raise_error SystemExit
       end
     end
=begin
     it "it reloads the method when wrong input is entered" do
       allow(@game_engine).to receive(:puts).and_return(nil)
       allow(@game_engine).to receive(:gets).and_return('k')
       allow(@game_engine).to receive(:load_mode).and_return(nil)
       expect(@game_engine.load_mode).to eq(nil)
     end
=end
   end
   describe '#game_level' do
     context 'advanced' do
       let(:level) {'advanced'}
       it{ expect(@game_engine.game_level(level)).to be_a Symbol }
     end
     context 'beginner' do
       let(:level) {'beginner'}
       it{ expect(@game_engine.game_level(level)).to be_a Symbol }
     end
     context 'intermediate' do
       let(:level) {'intermediate'}
       it{ expect(@game_engine.game_level(level)).to be_a Symbol}
     end
     context 'quit' do
       let(:level) {'quit'}
       it{ expect{@game_engine.game_level(level)}.to raise_error SystemExit }
     end
     context 'wrong input' do
       let(:level) {'the'}
       it 'prints error message and call the select_level method' do
         allow(@game_engine).to receive(:puts).and_return(nil)
         allow(@game_engine).to receive(:select_level).and_return(nil)
         expect(@game_engine.game_level(level)).to eq(nil)
       end
     end
   end

   context '#select_level' do
     it "selects level" do
       allow(@game_engine).to receive(:puts).and_return(nil)
       allow(@game_engine).to receive(:gets).and_return('s')
       allow(@game_engine).to receive(:game_level).and_return(nil)
       expect(@game_engine.select_level).to eq(nil)
     end
   end

   context '#load_instructions' do
     it "selects level" do
       allow(@game_engine).to receive(:puts).and_return(nil)
       allow(@game_engine).to receive(:gets).and_return('menu')
       allow(@game_engine).to receive(:game_exit).and_return(nil)
       allow(@game_engine).to receive(:game_menu).and_return(nil)
       expect(@game_engine.load_instructions).to eq(nil)
     end
   end
   context '#supported_actions' do
     let(:level) {'the'}
     it{ expect(@game_engine.supported_actions).to be_a Hash }
   end

   describe '#player_action' do
     context 'instruction' do
       let(:select_action) {'i'}
       it "executes the proper command based on the input entered" do
         allow(@game_engine).to receive(:load_instructions).and_return(nil)
         expect(@game_engine.player_action(select_action)).to eq(nil)
       end
     end
     context 'high scores' do
       let(:select_action) {'t'}
       it "executes the proper command based on the input entered" do
         allow(@game_engine).to receive(:top_ten).and_return(nil)
         expect(@game_engine.player_action(select_action)).to eq(nil)
       end
     end
     context 'quit' do
       let(:select_action) {'q'}
       it{ expect{@game_engine.player_action(select_action)}.to raise_error SystemExit }
     end
     context 'wrong input' do
       let(:select_action) {'the'}
       it 'loads the menu for wrong input' do
         allow(@game_engine).to receive(:puts).and_return(nil)
         allow(@game_engine).to receive(:game_menu).and_return(nil)
         expect(@game_engine.player_action(select_action)).to eq(nil)
       end
     end
   end
=begin
  context '#begin_game_initialize' do
     let(:game_level) {:beginner}
     let(:game_level) {:beginner}
    let(:computer_handler) {Lekanmastermind::Computer.new(@game_level)}
    let(:file_handler) {Lekanmastermind::FileHandler.new}
    obj = Lekanmastermind::Computer.new(@game_level)

    it 'loads the menu for wrong input' do
      allow(initializer).to receive(:puts).and_return(nil)
      expect(initializer.begin_game_initialize).to eq(nil)
    end
  end
=end
end
