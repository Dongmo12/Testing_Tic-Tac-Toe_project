require_relative "../lib/game_logic"
require_relative "../lib/board"
require_relative "../lib/player"

RSpec.describe GameLogic do
  let(:board) { Board.new }
  let(:player_one) { Player.new('user_one', 'X') }
  let(:player_two) { Player.new('user_two', 'O') }
  let(:game) { GameLogic.new(player_one, player_two, board) }
  let(:input) { [1, 2, 3, 4, 5, 6, 7, 8, 9] }
  let(:win){[[1, 2, 3], [1, 4, 7], [1, 5, 9], [2, 5, 8], [3, 6, 9], [3, 5, 7],
    [4, 5, 6], [7, 8, 9]]}

  it 'instantiates the class with 3 arguments' do
    expect(GameLogic).to receive(:new).with(player_one, player_two, board)
    GameLogic.new(player_one, player_two, board)
  end

  it 'test initialize player one' do
    expect(game.player_one.name).to eql('user_one')
  end

  it 'test initialize player two' do
    expect(game.player_two.name).to eql('user_two')
  end

  describe '#valid_move?' do
    it 'checks if input is an integer from 1 - 9' do
      case input
      when input[0]
        expect(game.valid_move?(input[0])).to eql(true)
      when input[1]
        expect(game.valid_move?(input[1])).to eql(true)
      when input[2]
        expect(game.valid_move?(input[2])).to eql(true)
      when input[3]
        expect(game.valid_move?(input[3])).to eql(true)
      when input[4]
        expect(game.valid_move?(input[4])).to eql(true)
      when input[5]
        expect(game.valid_move?(input[5])).to eql(true)
      when input[6]
        expect(game.valid_move?(input[6])).to eql(true)
      when input[7]
        expect(game.valid_move?(input[7])).to eql(true)
      when input[8]
        expect(game.valid_move?(input[8])).to eql(true)
      else
        'invalid input'
      end
    end
    it 'Check if the number is not within the range' do
      expect(input.include?(1||2||3||4||5||6||7||8||9)).not_to eql(false)
    end
  end

  describe '#board_full?' do
    it 'checks if board is full' do
      expect(game.board_full? == false).to eql(board.post.any? { |x| x.is_a?(Integer) })
    end

    it 'checks if board is not full' do
      expect(game.board_full? == true).to eql(board.post.any? { |x| x.is_a?(String) })
    end
  end

  describe '#initialize' do
    it 'describe the initial input' do
      expect(game.player_one).to eql(player_one)
    end

    it 'describe the initial win' do
      
    end
  end
      
end
