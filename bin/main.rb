# frozen_string_literal: true

require_relative '../lib/board'
require_relative '../lib/player'
require_relative '../lib/game_logic'

board = Board.new
user_one = Player.new('user_one', 'X')
user_two = Player.new('user_two', 'O')

def receive_player_input(player, symbol)
  display_message "Enter username for #{player}. You are player \'#{symbol}\'."
  gets.chomp.to_s.capitalize
end

def setup_users
  display_message ' Welcome to the tic-tac-toe game !! '
  @board.display
  @userid1 = 'X'
  @player_one = receive_player_input('player one', @userid1)
  @userid2 = 'O'
  @player_two = receive_player_input('player two', @userid2)
end

def display_message(input)
  puts input
end

def accept_single_character_input
  gets.chomp.to_i
end

GameLogic.new(user_one, user_two, board).game_play
