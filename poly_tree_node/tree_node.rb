class PolyTreeNode
  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end

  def parent
    @parent
  end

  def children
    @children
  end

  def value
    @value
  end

  def add_child(child)
    @children << child
    child.parent = self
  end

  def parent=(parent)
    @parent = parent
  end
end
