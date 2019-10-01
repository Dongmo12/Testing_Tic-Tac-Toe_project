# frozen_string_literal: true

# This class represents the player
class Player
  attr_accessor :name
  attr_accessor :play_symbol
  def initialize(name, play_symbol)
    @name = name
    @play_symbol = play_symbol
  end
end
