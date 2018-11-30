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

  def parent=(parent_node)
    @parent.children.delete(self) unless @parent == nil
    @parent = parent_node
    @parent.children << self unless parent_node == nil
  end

  def add_child(child_node)
    child_node.parent = self
  end

  def remove_child(child_node)
    raise "not a child" unless @children.include?(child_node)
    child_node.parent = nil
  end


end


# lib/00_tree_node.rb
