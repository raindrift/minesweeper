require 'rspec'
require 'board'

require 'pry'

describe Board do
  let(:board) { described_class.new(3,4,5) }

  it 'takes a width, height, and number of mines' do
    expect(board).to be_a(Board)
  end

  describe '#board' do
    it 'returns a full board' do
      5.times do
        expect(board.board.length).to eq 12
      end
    end

    it 'returns the correct number of true values' do
      expect(board.board.select{|v| v}.length).to eq 5
    end
  end

  describe '#stacked_board' do
    it 'returns the correct number of true values' do
      expect(board.stacked_board.length).to eq 4
      expect(board.stacked_board[0].length).to eq 3
    end
  end

  describe '#to_s' do
    it 'returns the entire board as a big string' do
      expect(board.to_s).to be_a String
      binding.pry
      board.to_s.split("\n").each do |line|
        expect(line.length).to eq 5
      end
    end
  end
end
