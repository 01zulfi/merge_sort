# frozen_string_literal: true

def merge_sort(array)
  return array if array.length < 2

  left_array, right_array = split_arrays_evenly(array)

  left_sorted = merge_sort(left_array)
  right_sorted = merge_sort(right_array)

  compare(left_sorted, right_sorted)
end

def compare(left_array, right_array)
  left_array.first < right_array.first ? [left_array.first, right_array.first] : [right_array.first, left_array.first]
end

def split_arrays_evenly(array)
  left_size = (array.length / 2).round - 1
  [array[0..left_size], array[left_size + 1..array.length]]
end

p merge_sort([4,2,1,3])