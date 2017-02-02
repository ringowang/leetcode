# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}
def two_sum(nums, target)
  @array = []
  nums.each_with_index do |each, index|
    @array << index if nums.include?(target - each) && each * 2 == target && nums.count(each) != 1
    @array << index if nums.include?(target - each) && each * 2 != target
  end
  @array
end

def two_sum2(nums, target)
  hash = {}
  nums.each_with_index do |n, i|
    return [hash[n], i] if hash[n] != nil
    hash[target - n] = i
  end
end


def two_sum3(nums, target)
  hash = {}
  nums.each_with_index do |n, i|
    hash[(target - n)] ? (return [hash[(target - n)], i]) : hash[n] = i
  end
end
