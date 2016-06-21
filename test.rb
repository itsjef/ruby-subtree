require './tree'
require 'test/unit'

class TreeTest < Test::Unit::TestCase
  def setup
    #tree 1
    @tree1 = Tree.new
    @tree1.root = Node.new(1)
    @tree1.root.left = Node.new(2)
    @tree1.root.right = Node.new(3)

    @tree1.root.right.left = Node.new(4)
    @tree1.root.right.right = Node.new(5)

    @tree1.root.right.right.left = Node.new(6)
    @tree1.root.right.right.right = Node.new(7)

    #tree 2
    @tree2 = Tree.new
    @tree2.root = Node.new(-1)
    @tree2.root.left = Node.new(-2)
    @tree2.root.right = Node.new(-3)
  end

  def test_nil
    assert Tree.subtree?(@tree1.root, nil), "test nil node is subtree of normal tree"
    assert Tree.subtree?(nil, nil),         "test nil node is subtree of nil tree"
    assert_equal false, Tree.subtree?(nil, @tree1.root), "test nil tree does not have subtree"
  end

  def test_leaf
    assert Tree.subtree?(@tree1.root, @tree1.root.right.left),        "test leaf is subtree"
    assert_equal false, Tree.subtree?(@tree1.root, @tree2.root.left), "test leaf is not subtree"
  end

  def test_branch
    assert Tree.subtree?(@tree1.root, @tree1.root.right),             "test subtree at root"
    assert Tree.subtree?(@tree1.root.right, @tree1.root.right),       "test subtree at branch"
    assert_equal false, Tree.subtree?(@tree1.root, @tree2.root),      "test not subtree at root"
    assert_equal false, Tree.subtree?(@tree1.root.left, @tree2.root), "test not subtree at branch"
  end
end
