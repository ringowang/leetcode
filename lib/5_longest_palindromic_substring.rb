# my failuer method
# def longest_palindrome(s)
#   output = ''
#   (0..s.length - 1).each do |n|
#     tem = s[n]
#     i = 1
#     while s[n - i] == s[n + i] && n - i >= 0

#       tem = s[n - i] + tem + s[n + i] if n - i >= 0
#       i += 1
#       output = tem if tem.length > output.length
#     end

#     if s[n] == s[n + 1]
#       tem = s[n] * 2
#       i = 1
#       output = tem if tem.length > output.length
#       while s[n - i] == s[n + i + 1] && n - i >= 0
#         tem = s[n - i] + tem + s[n + i + 1] if n - i >= 0
#         i += 1
#         output = tem if tem.length > output.length
#       end
#     end
#   end
#   output
# end

# # method No.1 O(n3)
# def huiwen?(s)
#   k = s.length / 2
#   (0..k).each do |i|
#     return false if s[i] != s[s.length - 1 - i]
#   end
#   true
# end
#
# def longest_palindrome(s)
#   max = 0
#   str = ''
#   (0..s.length).each do |i|
#     ((i + 1)..s.length).each do |j|
#       max, str = j - i, s[i..j] if huiwen?(s[i..j]) && (j - i) > max
#     end
#   end
#   str
# end

# # method No.2 O(n2)
# outside into inside
# def longest_palindrome(s)
#   # dp = Array.new(s.length, Array.new(s.length, false))
#   dp = Array.new(s.length) { |i| Array.new(s.length) { |j| i > j } }
#   maxlength = 0
#   maxstart = 0
#   (0..s.length - 1).each do |i|
#     # i is the length of string
#     (0..s.length - i - 1).each do |j|
#       if i.zero?
#         dp[j][j + i] = true
#       elsif s[j + i] == s[j] && j + 1 < s.length
#         dp[j][j + i] = dp[j + 1][j + i - 1]
#       end
#       if dp[j][j + i] && (i > maxlength)
#         maxlength = i
#         maxstart = j
#       end
#     end
#   end
#   s[maxstart..(maxstart + maxlength)]
# end

# # No.3 O(n2)
# # almost same as No.2 but is from inside to outside
# def longest_palindrome(s)
#   $str = ''
#   (0..s.length).each do |i|
#     helper(s, i, 0)
#     helper(s, i, 1)
#   end
#   $str
# end

# def helper(s, idx, offset)
#   left = idx
#   right = left + offset
#   tem = ''
#   while left >= 0 && right < s.length && s[left] == s[right]
#     tem = s[left..right]
#     left -= 1
#     right += 1
#   end
#   $str = tem if tem.length > $str.length
# end

# manacher algorithm
def longest_palindrome(str)
  s = (str.split('').map { |a| '#' + a } + ['#']).join.split('')
  mx = 0
  id = 0
  p = []
  (0..s.size - 1).each do |i|
    p[i] = (mx > i ? [p[2 * id - i], mx - i].min : 1)
    (p[i] = p[i] + 1) while s[i + p[i]] == s[i - p[i]]
    # p "i: #{i}, mx: #{mx}, id: #{id}, p[i]: #{p[i]}"
    if i + p[i] > mx
      mx = i + p[i] - 1
      id = i
    end
    # p "i: #{i}, mx: #{mx}, id: #{id}, p[i]: #{p[i]}"
    # p p
    # p '-----------'
  end
  # p "id: #{id}, p.max: #{p.max}, s: #{s}"
  final_id = p.index(p.max)
  s[(final_id - p.max + 1)..(final_id + p.max - 1)].join.delete('#')
end
