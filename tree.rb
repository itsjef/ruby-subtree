class Node
  attr_accessor :data, :left, :right
  def initialize(data)
    @data = data
    @left = @right = nil
  end
end

class Tree
  attr_accessor :root

  def self.subtree?(node1, node2) 
    if node2.nil?
      true
    elsif node1.nil?
      false
    elsif identical? node1, node2
      true
    else
      subtree? node1.left, node2 or
      subtree? node1.right, node2
    end
  end

  private

  def self.identical?(node1, node2)
    if node1.nil? and node2.nil?
      true
    elsif node1.nil? or node2.nil?
      false
    else
      node1.data == node2.data and
      identical? node1.left, node2.left and
      identical? node1.right, node2.right
    end
  end
end
