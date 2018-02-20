class Array
  def bubble_sort
    sorted = false
    until sorted
      sorted = true
      each_index do |i|
        next if i + 1 == self.length
        if self[i] > self[i+1]
          self[i], self[i+1] = self[i+1], self[i]
          sorted = false
        end
      end
    end
  end

  def bubble_sort!(&prc)
    sorted = false
    until sorted
      sorted = true
      each_index do |i|
        next if i + 1 == self.length
        if prc.call(self[i],self[i+1])
          self[i], self[i+1] = self[i+1], self[i]
          sorted = false
        end
      end
    end
  end

  def bubble_sort(&prc)
    self.dup.bubble_sort!(&prc)
  end
end
