# lib/00_tree_node.rb
# require "byebug"

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

  def dfs(target_value)
    return self if target_value == @value
    @children.each do |child|
      deeper_search = child.dfs(target_value)
      return deeper_search unless deeper_search == nil
    end
    nil
  end

  def bfs(target_value)
    queue = [self]
    until queue.empty?
      next_to_check = queue.shift
      return next_to_check if next_to_check.value == target_value
      queue += next_to_check.children
    end
    nil
  end

  def inspect
    @value.inspect
  end

end
