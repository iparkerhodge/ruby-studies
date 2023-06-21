# frozen_string_literal: true

# Ruby has no built-in support for linked lists, so I'll create my own
# The class should provide find, append, append_after, and delete methods
class LinkedList
  def initialize
    @head = nil
  end

  ########
  # FIND #
  ########

  # find the last node in the list
  def find_tail
    node = @head

    return node unless node.next

    while (node = node.next)
      return node unless node.next
    end
  end

  # find a target node by its value
  def find(val)
    node = @head

    return false unless node.next
    return node if node.value == val

    while (node = node.next)
      return node if node.value == val
    end
  end

  # find the preceding node by a value
  def find_before(val)
    node = @head

    return false unless node.next
    return node if node.next.value == val

    while (node = node.next)
      return node if node.next && node.next.value == val
    end
  end

  ##########
  # APPEND #
  ##########

  # append to end of list
  def append(val)
    if @head
      find_tail.next = Node.new(val)
    else
      @head = Node.new(val)
    end
  end

  # append a new node after a target node
  def append_after(target_val, val)
    node = find(target_val)
    return unless node

    old_next = node.next
    node.next = Node.new(val)
    node.next.next = old_next
  end

  ##########
  # DELETE #
  ##########

  # delete a node by its value
  def delete(val)
    if @head.value == val
      @head = @head.next
      return
    end

    node = find_before(val)
    node.next = node.next.next
  end

  def print
    node = @head
    puts node

    while (node = node.next)
      puts node
    end
  end
end

class Node
  attr_accessor :next
  attr_reader :value

  def initialize(val)
    @value = val
    @next = nil
  end

  def to_s
    "Node with value #{@value}"
  end
end

def test
  list = LinkedList.new
  list.append(10)
  list.append(20)
  list.append(30)
  list.append_after(10, 15)
  list.append_after(20, 25)
  list.delete(10)
  list.print
end

test
