class Board
  def initialize width, height, mines
    @width = width
    @height = height
    @mines = mines
    @total_mines = width * height
  end

  attr_reader :width, :height, :mines, :total_mines

  def to_s
    output = ''
    stacked_board.each do |row|
      output += row.map{|v| v ? '*' : '_' }.join(' ')
      output += "\n"
    end
    output
  end

  def stacked_board
    stacked_board = []
    (0..(height-1)).each do |row|
      stacked_board[row] = board.slice(row*width, width)
    end
    stacked_board
  end

  def board
    return @board if @board
    @board = []

    i = mines
    while(i > 0) do
      offset = rand(0..total_mines - 1)
      unless @board[offset]
        @board[offset] = true
      else
        next
      end
      i -= 1
    end

    @board
  end

end
