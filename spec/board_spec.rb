require './lib/board'

RSpec.describe Board do
  it 'make sure the length of the position is 9' do
    expect(Board.new.post.length).to eql(9)
  end
end
