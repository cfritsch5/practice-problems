def solution(a)
  # write your code in Ruby 2.2
  binding.pry
  trips = Hash.new {|h,k| h[k]=0}
  start = 0
  ending = 0
  min = nil
  a.each_with_index do |trip,i|
    ending = i

    if trips[trip] == 0
      min = ending - start
    end
    trips[trip] += 1

    while start < ending
    break if trips[a[start]] - 1 == 0
    trips[start] -=  1
    start += 1
    min = ending - start if ending-start < min
    end
  end
  min
end
