require "./lib/player"

RSpec.describe Player do
    it " Tests our Player Name " do
        player = Player.new( 'player', 'T')
        expect( player.name ).to eql( 'player' )
    end

    it " Tests our Player Symbols " do
        player = Player.new( 'player', 'T')
        expect( player.playSymbol ).to eql( 'T' )
    end
end