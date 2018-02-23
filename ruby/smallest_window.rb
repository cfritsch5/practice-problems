require 'pry'
#dynamic exprogramming, the kind of
#subtler ones like find the smallest window in an
#array that contains all unique elements

def smallest_window(array, set)
  #set is a hash???
  min_win = 0
  return nil if array.length < set.count
  i = 0
  j = 0
  while i < array.length
    if contains_set?(set, array[i..j])
      i += 1
      min_win = [i,j]
    elsif j < array.length
      j += 1
    else
      break
    end
  end
  min_win
end


def contains_set(set, window)
  window.all? { |e|  set[e]}
end
