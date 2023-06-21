# frozen_string_literal: true

# flatten an array recursively
# yes, Ruby already has a Array#flatten method, but this is for ~practice~
def recursive_flatten(arr, results = [])
  arr.each do |elem|
    if elem.is_a? Array
      recursive_flatten(elem, results)
    else
      results << elem
    end
  end
  results
end

def test
  arr1 = [1, 2, 3]
  puts "Input: #{arr1}; Output: #{recursive_flatten(arr1)}"

  arr2 = [arr1, 4, 5]
  puts "Input: #{arr2}; Output: #{recursive_flatten(arr2)}"

  arr3 = [arr2, 6, 7]
  puts "Input: #{arr3}; Output: #{recursive_flatten(arr3)}"
end

test
