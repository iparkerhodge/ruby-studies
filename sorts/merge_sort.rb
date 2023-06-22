# frozen_string_literal: true

# O(n logn)
class MergeSort
  def sort(enum)
    return enum if enum.length < 2

    half = (enum.length / 2).round

    left = enum.take(half)
    right = enum.drop(half)

    sorted_l = sort(left)
    sorted_r = sort(right)

    merge(sorted_l, sorted_r)
  end

  def merge(left, right)
    return left if right.empty?
    return right if left.empty?

    min = left.first <= right.first ? left.shift : right.shift

    merged = merge(left, right)

    [min].concat(merged)
  end

  def test
    enum1 = [10, 9, 8, 7, 6, 5, 4, 3, 2, 1]
    puts "Input: #{enum1}; Output: #{sort(enum1)}"

    enum2 = [38, 27, 43, 3, 9, 82, 10]
    puts "Input: #{enum2}; Output: #{sort(enum2)}"

    enum3 = [12]
    puts "Input: #{enum3}; Output: #{sort(enum3)}"

    enum4 = []
    puts "Input: #{enum4}; Output: #{sort(enum4)}"
  end
end

MergeSort.new.test
