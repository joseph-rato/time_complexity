#  Bruteforce O(n^2)
def bad_two_sum?(arr, target_sum)
  (0...arr.length).each do |i|
    (i+1...arr.length).each do |j|
      return true if arr[i] + arr[j] == target_sum
    end
  end
  false
end

def okay_two_sum?(arr, target_sum)
  arr.sort!
  arr.each do |el|
    return false if el > target_sum/2 + 1q
    new_target = target_sum - el
    return true if binary_search(arr, new_target)
  end
  false
end

def binary_search(arr, target)
  return nil if arr.empty?
  mid = arr.length/2
  case arr[mid] <=> target
  when 1
    binary_search(arr.take(mid), target)
  when 0
    mid
  when -1
    result = binary_search(arr.drop(mid+1), target)
    result.nil? ? nil : result + mid + 1
  end
end
