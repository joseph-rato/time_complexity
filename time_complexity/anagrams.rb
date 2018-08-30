
# phase 1 -- O(n!)
def first_anagram?(str, check)
  combinations(str.chars).include?(check.chars)
end

def combinations(arr_letters)
  return [arr_letters]  if arr_letters.length == 1
  first = [arr_letters.shift]
  rest = combinations(arr_letters)
  result = []

  rest.each_with_index do |comb, i|
    (0..comb.length-1).each do |insert|
      first_half = comb.take(insert)
      last_half = comb.drop(insert)
      result << first_half + first + last_half
    end
  end
  result
end

# phase 2 -- O(n)
def second_anagram?(str, check)
  str.chars.each do |letter|
    return false if check.chars.find_index(letter).nil?
    idx = check.chars.find_index(letter)
    check = check[0...idx] + check[idx+1..-1]
  end
  return false if check.length > 0
  true
end

# phase 3 -- O(n^2) (average case => n^2)
def third_anagram?(str, check)
  str.chars.sort.join == check.chars.sort.join
end

# phase 4 -- O(n)
def fourth_anagram?(str, check)
  hash1 = Hash.new(0)
  hash2 = Hash.new(0)
  str.chars.each { |letter| hash1[letter] += 1 }
  check.chars.each { |letter| hash2[letter] += 1 }
  hash1 == hash2
end

# bonus

def fifth_anagram(str, check)
  hash = Hash.new(0)
  (str.chars + check.chars).each do |letter|
    hash[letter] == 0 ? hash[letter] += 1 : hash[letter] -= 1
  end
  !hash.values.any? {|value| value > 0}
end
