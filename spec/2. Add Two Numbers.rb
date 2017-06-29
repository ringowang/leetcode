# Definition for singly-linked list.
# class ListNode
#   attr_accessor :val, :next
#   def initialize(val)
#       @val = val
#       @next = nil
#   end
# end

# @param {ListNode} l1
# @param {ListNode} l2
# @return {ListNode}
def add_two_numbers(l1, l2)
  @array = [0, 0]
  @z1 = nil
  @z2 = nil
  # @array = (l1.val + l2.val).divmod(10)
  if l1.val.zero? && l2.val.zero? && l1.next.nil? && l2.next.nil?
    return ListNode.new(0)
  end
  l3 = head = ListNode.new(0)
  while true
    @array = ((@z1 || l1.val) + (@z2 || l2.val) + @array[0]).divmod(10)
    break if @array == [0, 0] && @z1.zero? && @z2.zero?
    head.next = ListNode.new(@array[1])
    !l1.next.nil? ? l1 = l1.next : @z1 = 0
    !l2.next.nil? ? l2 = l2.next : @z2 = 0
    head = head.next
    p l3
  end
  head.next = ListNode.new(1) if @array[0] != 0
  l3.next
end

def add_two_numbers(l1, l2)
  l3 = ListNode.new(0)
  @head = l3
  @array = [0, 0]
  while !l1.nil? && !l2.nil?
    @array = (l1.val + l2.val + @array[0]).divmod(10)
    @head.next = ListNode.new(@array[1])
    l1 = l1.next
    l2 = l2.next
    @head = @head.next
  end
  @rest = (l1.nil? ? l2 : l1)
  while !@rest.nil?
    @array = (@rest.val + @array[0]).divmod(10)
    @head.next = ListNode.new(@array[1])
    @rest = @rest.next
    @head = @head.next
  end
  @head.next = ListNode.new(1) if @array[0] != 0
  l3.next
end
