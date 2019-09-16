# frozen_string_literal: true

require 'set'

# This class contains the game's logic
class GameLogic
  attr_accessor :player_one
  attr_accessor :player_two
  
  def initialize(player_one, player_two, board)
    @player_one = player_one
    @player_two = player_two
    @board = board
    # operate based on moves made by player
    @wins = [
      [1, 2, 3], [1, 4, 7], [1, 5, 9], [2, 5, 8], [3, 6, 9], [3, 5, 7],
      [4, 5, 6], [7, 8, 9]
    ]
    @options = []
    @counter = 0
    @option = 0
  end

  def valid_move?(input)
    unless input.is_a?(Integer) && (input < 9 || input.positive?) &&
           !@options.include?(input)
      display_message('Invalid Input')
      return false
    end
    true
  end

  def board_full?
    return false if @board.post.any? { |x| x.is_a?(Integer) }

    true
  end

  def process_moves(option, character, current_player)
    @wins = @wins.each do |moves|
      moves[moves.find_index(option)] = character if moves.include? option
      next unless Set.new(moves).length == 1

      display_message('GAME OVER!')
      display_message("#{current_player} Wins!")
      @board.display
      return true
    end
    false
  end

  def receive_option
    @board.display
    @current_player = @counter.even? ? @player_one : @player_two
    loop do
      display_message("#{@current_player}, select an option from 1...9")
      @option = accept_single_character_input
      break if valid_move? @option
    end
    @character = (@counter.even? ? @userid1 : @userid2).to_s
    @board.post[@option - 1] = @character if @board.post.include? @option
  end

  def continue_playing_until_player_wins_or_board_is_full
    until board_full?
      receive_option
      player_won = process_moves(@option, @character, @current_player)
      if player_won
        return true # player won
      end

      @options.push(@option)
      @counter += 1
    end
    false # board is full
  end

  def game_play
    setup_users

    board_is_full = continue_playing_until_player_wins_or_board_is_full
    return unless board_is_full == false

    @board.display
    display_message('board full!')
    display_message('STALEMATE!')
  end
end
