class Array
  def quick_sort!(&prc)
    return self if size <= 1
    prc ||= Proc.new { |el, pivot| a < b}

    pivot = shift
    left = select { |el| prc.call(el,pivot)}
    right = select { |el| prc.call(el,pivot)}

    left.quick_sort(&prc)  + [pivot] + right.quick_sort(&prc)
  end

  def quick_sort(&prc)
    dup.quick_sort!(&prc)
  end
end
