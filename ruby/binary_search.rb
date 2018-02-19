class Array
  def binary_search(target)
    #binary search assumes sorted array 
    return nil if length == 0

    case self[size/2] <=> target
    when 0
      return size/2
    when 1
      return self.dup.take(size/2).binary_search(target)
    else
      result = self.dup.drop(size/2.binary_search(target))
      result ? size/2 + 1 + result : nil
    end
  end
end
