require "./lib/player"

RSpec.describe Player do
  it 'Tests the player name' do
    player = Player.new('player', 'T')
    expect(player.name).to eql('player')
  end

  it 'Tests the player symbols' do
    player = Player.new('player', 'T')
    expect(player.play_symbol).to eql('T')
  end
end
