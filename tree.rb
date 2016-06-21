class Node
  attr_accessor :data, :left, :right
  def initialize(data)
    @data = data
    @left = @right = nil
  end
end

class Tree
  attr_accessor :root

  def self.subtree?(root1, root2)
    if root2.nil? # a nil node is obviously subtree of any tree
      true
    elsif root1.nil? # a tree with nil root doen not have any subtree
      false
    elsif identical? root1, root2 # 2 trees with identical root is obviously each other's subtree
      true
    else
      # not an obvious subtree? 
      # check if 2nd tree is a subtree at the left or right branch of 1st tree
      subtree? root1.left, root2 or
      subtree? root1.right, root2
    end
  end

  private

  def self.identical?(node1, node2)
    if node1.nil? and node2.nil? # 2 nil nodes are obviously identical
      true
    elsif node1.nil? or node2.nil? # but if one of them are nil, then they are not
      false
    else
      # 2 identical nodes should have their data the same as well as successor nodes'
      node1.data == node2.data and
      identical? node1.left, node2.left and
      identical? node1.right, node2.right
    end
  end
end
