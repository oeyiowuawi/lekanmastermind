require 'spec_helper'
describe Lekanmastermind::GameInitializer do
  #let(:initializer) { Class.new.extend(Lekanmastermind::GameInitializer)}

  before :each  do
      @game_engine = Lekanmastermind::GameEngine.new
      #@player1 =
    end
  context 'init_two_players' do
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
   context '#load_mode' do
     it "returns single for single player" do
       allow(@game_engine).to receive(:puts).and_return(nil)
       allow(@game_engine).to receive(:gets).and_return("single")
       expect(@game_engine.load_mode).to eq('single')
     end
     it "initializes miltiplayer player" do
       allow(@game_engine).to receive(:puts).and_return(nil)
       allow(@game_engine).to receive(:gets).and_return("multiplayer")
       expect(@game_engine.load_mode).to eq('multiplayer')
     end
     it "quits the game" do
       allow(@game_engine).to receive(:puts).and_return(nil)
       allow(@game_engine).to receive(:gets).and_return("quit")
       expect{@game_engine.load_mode}.to raise_error SystemExit
     end
=begin
     it "it reloads the method when wrong input is entered" do
       allow(@game_engine).to receive(:puts).and_return(nil)
       allow(@game_engine).to receive(:load_mode).and_return(nil)
       expect{@game_engine.load_mode}.to eq(nil)
     end
=end
   end
   context '#game_level' do
     let(:level) {'advanced'}
     it{ expect(@game_engine.game_level(level)).to be_a Symbol }
   end
   context '#game_level' do
     let(:level) {'beginner'}
     it{ expect(@game_engine.game_level(level)).to be_a Symbol }
   end
   context '#game_level' do
     let(:level) {'intermediate'}
     it{ expect(@game_engine.game_level(level)).to be_a Symbol}
   end
   context '#game_level' do
     let(:level) {'quit'}
     it{ expect{@game_engine.game_level(level)}.to raise_error SystemExit }
   end
   context '#game_level' do
     let(:level) {'the'}
     it{ expect(@game_engine.game_level(level)).to be_a Symbol }
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
   context '#player_action' do
     let(:select_action) {'i'}
     it "executes the proper command based on the input entered" do
       allow(@game_engine).to receive(:load_instructions).and_return(nil)
       expect(@game_engine.player_action(select_action)).to eq(nil)
     end
   end
   context '#player_action' do
     let(:select_action) {'q'}
     it{ expect{@game_engine.player_action(select_action)}.to raise_error SystemExit }
   end
   context '#player_action' do
     let(:select_action) {'the'}
     it 'loads the menu for wrong input' do
       allow(@game_engine).to receive(:puts).and_return(nil)
       allow(@game_engine).to receive(:game_menu).and_return(nil)
       expect(@game_engine.player_action(select_action)).to eq(nil)
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
