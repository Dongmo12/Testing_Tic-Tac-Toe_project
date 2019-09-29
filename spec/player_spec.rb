require_relative "../lib/player"

RSpec.describe Player do
  let(:player) {Player.new('player', 'T')}

  it 'Tests the player name' do     
    expect(player.name).to eql('player')
  end

  it 'Tests the player symbols' do  
    #expect(player.play_symbol).to eql('T')
  end
end
