# frozen_string_literal: true

# recursively sum numbers in an array
def recursive_sum(arr)
  return 0 if arr.empty?

  sum = arr.pop
  sum + recursive_sum(arr)
end

def test
  arr1 = [1, 2, 3, 4, 5, 6]
  puts "Input: #{arr1}; Output: #{recursive_sum(arr1)}"

  arr2 = [12, 24, 36, 48, 60, 72]
  puts "Input: #{arr2}; Output: #{recursive_sum(arr2)}"
end

test
