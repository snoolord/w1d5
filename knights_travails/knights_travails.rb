require_relative "../poly_tree_node/tree_node"
require 'thread'
# Write a class, KnightPathFinder. Initialize your KnightPathFinder with
# a starting position. For instance
#
# kpf = KnightPathFinder.new([0, 0])
# Ultimately, I want to be able to find paths to end positions:
#
# kpf.find_path([2, 1]) # => [[0, 0], [2, 1]]
# kpf.find_path([3, 3]) # => [[0, 0], [2, 1], [3, 3]]
class KnightPathFinder
  DIRS = [[-2,-1],[-2,1],[2,-1],[2,1],[-1,-2],[1,-2],[1,2],[-1,2]]
  def initialize(starting_pos=[0,0], grid = Array.new(8){Array.new(8)})
    @grid = grid # 8 x 8 grid
    @starting_pos = PolyTreeNode.new(starting_pos)
    self.build_move_tree
    @visited_positions = [@starting_pos]
  end

  # def find_path
  # end
  def valid_moves(pos)
    x,y = pos
    valid_moves = []
    DIRS.each do |dir|
      i,j = dir
      next if x+i <0 || x+i >7 || y +j <0 || y +j >7
      valid_moves << [x+i,y+j]
    end
  end

  def new_move_positions(pos)
    avail_moves = pos.valid_moves.select {|move| !@visited_positions.include?(move)}
    avail_moves.map do |move|
      PolyTreeNode.new(move)
    end
    avail_moves.each do |node|
      node.parent = pos
    end
  end

  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def build_move_tree #build the move tree and store it in an instance variable.
    end_point = PolyTreeNode.new([4,3])
    positions = Queue.new
    positions.push(@starting_pos)
    until positions.empty?
      node = positions.pop
      return node if node.value == end_point.value
      new_move_positions(nod).each do |child_node|
        positions.push(child_node)
      end

    end
    nil
  end


end
