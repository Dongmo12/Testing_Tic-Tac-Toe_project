
RSpec.describe do
  describe 'GameLogic.new.game_play' do
    it 'starts the game and Ibrahim (player one) wins' do
      allow($stdin).to receive(:gets).and_return('test', 'Ibrahim', 'Armand', '1', '2', '3', '4', '5', '6', '7')
      text_value = $stdin.gets
      expect(text_value).to eq('test')
      require_relative '../bin/init'
      expect do
        GameLogic.new.game_play
      end.to output(/Ibrahim Wins!/).to_stdout
    end
  end

  describe 'GameLogic.new.game_play' do
    it 'starts the game and Armand (player two) wins' do
      allow($stdin).to receive(:gets).and_return('test', 'Ibrahim', 'Armand', '1', '2', '4', '5', '9', '8')
      text_value = $stdin.gets
      expect(text_value).to eq('test')
      require_relative '../bin/init'
      expect do
        GameLogic.new.game_play
      end.to output(/Armand Wins!/).to_stdout
    end
  end

  describe 'GameLogic.new.game_play' do
    it 'starts the game and game ends in a draw' do
      allow($stdin).to receive(:gets).and_return('test', 'Armand', 'Ibrahim', '1', '2', '4', '5', '3', '6', '8', '7', '9')
      text_value = $stdin.gets
      expect(text_value).to eq('test')
      require_relative '../bin/init'
      expect do
        GameLogic.new.game_play
      end.to output(/STALEMATE!/).to_stdout
    end
  end

  describe 'accept_user_input' do
    it 'gets the user\'s input' do
      allow($stdin).to receive(:gets).and_return('5')
      text_value = accept_single_character_input
      expect(text_value).to eq(5)
    end
  end

  describe 'accept_single_integer_input' do
    it 'gets the user\'s integer input' do
      allow($stdin).to receive(:gets).and_return('20')
      integer_value = $stdin.gets.chomp.to_i
      expect(integer_value).to eq(20)
    end
  end
end
