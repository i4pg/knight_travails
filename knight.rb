# frozen_string_literal: false

# generate Chess Board on the fly
class Board
  attr_accessor :col, :row, :cell, :moves, :parent

  def initialize(position, moves, parent = nil)
    @cell = position
    @moves = moves
    @col = position[0]
    @row = position[1]
    @parent = parent
  end
end

# main class
class Knight
  def initialize(start, distnation)
    @col = start[0]
    @row = start[1]
    @distnation = distnation
    @moves = 0
    # @visted = []
    @knight = Board.new(start, @moves)
    @queue = [@knight]
    travails
  end

  def possible_moves(col, row, moves, parent)
    one = Board.new([col + 1, row + 2], moves, parent) unless col + 1 > 7 || row + 2 > 7
    two = Board.new([col + 1, row - 2], moves, parent) unless col + 1 > 7 || row - 2 < 0
    three = Board.new([col + 2, row + 1], moves, parent) unless col + 2 > 7 || row + 1 > 7
    four = Board.new([col + 2, row - 1], moves, parent) unless col + 2 > 7 || row - 1 < 0
    five = Board.new([col - 1, row + 2], moves, parent) unless col - 1 < 0 || row + 2 > 7
    six = Board.new([col - 1, row - 2], moves, parent) unless col - 1 < 0 || row - 2 < 0
    seven = Board.new([col - 2, row + 1], moves, parent) unless col - 2 < 0 || row + 1 > 7
    eight = Board.new([col - 2, row - 1], moves, parent) unless col - 2 < 0 || row - 1 < 0
    [one, two, three, four, five, six, seven, eight].each do |move|
      @queue << move unless move.nil? # || @queue.include?(move) # || @visted.include?(move)
    end
  end

  def print_parent(node, arr = [])
    return arr.reverse.each { |node| p node } if node.nil?

    arr << node.cell
    print_parent(node.parent, arr)
  end

  def travails
    until @queue.empty?
      curr = @queue.shift
      #   @visted << curr
      if curr.cell == @distnation
        p "you made it in #{curr.moves} moves! Here's your path"
        print_parent(curr)
        return
      else
        possible_moves(curr.col, curr.row, curr.moves + 1, curr)
      end
    end
  end
end

Knight.new([0, 0], [7, 7])
