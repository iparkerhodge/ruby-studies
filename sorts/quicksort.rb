class Quicksort
  def sort(enum)
    return enum if enum.length < 2

    pivot = enum.sample
    left = enum.select { |el| el < pivot }
    right = enum.select { |el| el > pivot }
    sort(left) + [pivot] + sort(right)
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

Quicksort.new.test
