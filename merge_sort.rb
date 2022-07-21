# frozen_string_literal: true

def merge_sort(array)
  return array if array.length < 2

  left_array, right_array = split_arrays_evenly(array)

  left_sorted = merge_sort(left_array)
  right_sorted = merge_sort(right_array)

  merge_together(left_sorted, right_sorted)
end

# merge_together assumes that left_array & right_array are sorted
def merge_together(left_array, right_array)
  merged = []

  length_sums = left_array.length + right_array.length
  length_sums.times do
    break if left_array.empty? || right_array.empty?

    left_array.first < right_array.first ? merged.push(left_array.shift) : merged.push(right_array.shift)
  end

  merged + left_array + right_array
end

def split_arrays_evenly(array)
  left_size = (array.length / 2).round - 1
  [array[0..left_size], array[left_size + 1..array.length]]
end

p merge_sort([4, 2, 1, 3, 2, 7, 1])
p merge_sort([41, 22, 100, 13, 0, 77, 1])
p merge_sort([4, 717, 1, 12, 4, 6, 771, 2])
