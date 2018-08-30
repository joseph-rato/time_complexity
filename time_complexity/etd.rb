require 'byebug'

# phase 1 -- O(n^2)
def my_min_i(arr)
  arr.each do |first|
    min = true
    arr.each do |second|
      if second < first
        min = false
      end
    end
    return first if min
  end
end

# phase 2 -- O(n)
def my_min_ii(arr)
  min = arr.first
  arr[1..-1].each do |el|
    min = el if el < min
  end
  min
end


# phase 1 -- O(n^2)
def largest_contigous_subsum_i(list)
  sub_lists = []
  (0..(list.length - 1)).each do |start_idx|
    (start_idx..list.length-1).each do |end_idx|
      sub_lists << list[start_idx..end_idx]
    end
  end
  sub_lists.map { |el| el.reduce(:+) }.max
end

#phase 2 -- time: O(n), memory: O(1)
def largest_contigous_subsum_ii(list)
  current_sum = list.first
  max = list.first
  (1..-1).each do |i|
    current_sum += list[i]
    current_sum = 0 if current_sum < 0
    max = current_sum if max < current_sum
  end
  current_sum
end
