#this is an implementation of a non-balanced non-augmented binary search tree
class Node
  attr_accessor :key, :value, :parent, :left_child, :right_child

  def initialize(key, value, parent=nil ,left_child=nil, right_child=nil)
    @key          = key
    @value        = value
    @parent       = parent
    @left_child   = left_child
    @right_child  = right_child
  end
end

class BinarySearchTree

  def initialize(array)
    @original_array = array
    @root           = nil
    @BST            = initialize_bst
  end

  def search root, node
    nearest_ancestor = search_nearest_ancestor root, node
    
    if nearest_ancestor.key < node.key
      nearest_ancestor.right_child
    else
      nearest_ancestor.left_child
    end
  end

  def select

  end

  def min root
    root.left_child.nil? ? root : min root.left_child
  end

  def max root
    root.right_child.nil? ? root : max root.right_child
  end

  def predecessor node
    if node.left_child.nil?
      next_ancestor_less_than node
    else  
      max node.left_child
    end
  end

  def successor
    if node.right_child.nil?
      next_ancestor_more_than node
    else
      min node.right_child
    end
  end

  def rank

  end

  def keys_to_a root=@root
    [keys_to_a root.left_child, root.key, keys_to_a root.right_child ]
  end

  def insert node
    nearest_ancestor = search_nearest_ancestor @root, node
    
    if nearest_ancestor.key < node.key
      nearest_ancestor.right_child = node
    else
      nearest_ancestor.left_child = node
    end
  end

  def delete node
    number_of_children = number_of_children node

    if number_of_children == 0
      remove_from_parent node
    elsif number_of_children == 1
      #need to implement swap
      swap_nodes node node.parent
      delete node
    else
      #implement hard case
    end
  end

  private

  def initialize_bst
    @original_array.sort!

    @original_array.each do |node|

    end
  end

  def next_ancestor_less_than node
    if node.parent.key < node.key
      return node.parent
    else
      next_ancestor_less_than node.parent
    end
  end

  def next_ancestor_more_than node
    if node.parent.key > node.key
      return node.parent
    else
      next_ancestor_more_than node.parent
    end
  end

  def search_nearest_ancestor root, node
    if root.key == node.key
      return root.parent
    elsif root.key < node.key
      if root.left_child.nil?
        return root
      else
        search root.left_child, node
      end
    else
      if root.right_child.nil?
        return root
      else
        search root.right_child, node
      end
    end
  end

  def number_of_children node
    [node.left_child, node.right_child].compact.size
  end

  def remove_from_parent node
    if node.parent.left_child == node
      node.parent.left_child = nil
    else
      node.parent.right_child = nil
    end
  end

  def swap_nodes node_1, node_2
    #implement
  end
end