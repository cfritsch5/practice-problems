class Array
  def merge_sort(&prc)
    prc ||= Proc.new { |x,y| x <=> y }

    return self if size <=1
    left = take(size/2)
    right = drop(size/2)
    Array.merge(left, right, &prc)
  end

  def merge(left, right, &prc)
    sorted = []
    until left.empty? || right.empty?
      if prc.call(left.first, right.first)
        sorted << left.shift
      else
        sorted << right.shift
      end
    end
    sorted + left + right
  end
end
