# frozen_string_literal: true

# This class represents the player
class Player
  attr_writer :name
  attr_writer :play_symbol
  def initialize(name, play_symbol)
    @name = name
    @play_symbol = play_symbol
  end
end
