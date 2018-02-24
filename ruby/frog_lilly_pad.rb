@tree = {0=>[]}
@ids = 0

def can_cross(stones)
  # @tree = Hash.new {|h,k| h[k] = []}
  @tree = {0=>[]}
  @ids = 0
  [cross(stones), @tree]
end

def cross(stones, k = 0, parentID = 0)
  @ids += 1
  @tree[parentID] << {id: @ids, stones: stones.dup, k: k}
  @tree[@ids] = []
  # binding.pry
  p 'X'
    return true if stones.length <= 1
    current_pos = stones.shift
    j1 = k+1
    j2= k-1
    p1 = current_pos + j1
    p2 = current_pos + j2
    pos_1 = stones.index(p1) if stones.include?(p1)
    pos_2 = stones.index(p2) if stones.include?(p2)
    return ((pos_1 ? cross(stones[pos_1..-1], k + 1, @ids) : nil) || (pos_2 ? cross(stones[pos_2..-1], k - 1, @ids) : nil ))
end
