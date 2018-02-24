
#Generate maximum HH:MM from a list of 4 integers
#How to convert the given time to another format

# def max24hr(ints)
#   ints.sort #ruby uses quick sort O(nlogn)
#   time = []
#   # return nil if ints_less_2 < 1
#   # return nil if ints_less_5 < 2

#   while time.length < 4
#     case time.length
#     when 0
#       ints_less_2 = ints.select {|el| el <= 2}
#       return nil if ints_less_2.empty?
#       int = ints_less_2.pop
#       time << int
#       ints -= [int]
#       ints.delete_at(ints.index(n) || ints.length)
#     when 1
#       ints_less_4 = ints.select {|el| el <= 4}
#       if time[0] == 2
#         if ints_less_4.empty?
#           ints << time.pop
#         else
#           int = ints_less_4.pop
#           time << int
#           ints -= int
#         end
#       else
#         time << ints.pop
#       end
#     when 2
#       ints_less_5 = ints.select {|el| el <= 5}
#       if ints_less_5.empty?
#         ints << time.pop
#       end
#       int = ints_less_5.pop
#       time << int
#       ints -= int
#     when 3
#       time << ints.pop
#       break
#     end
#   end
#
#   format_time(time)
# end

def format_time(time)
  time[0..1].join + ':' + time[2..3].join
end

#time = []
#ints_remain = [x,x,x,x]
def max24hr_rec(ints)
  max24help(ints.sort) #O(4log4)=> 2.5 on ave 16 at worst
end
#i mean does big o even apply?
#b/c i thoght big o was for how an algorithm scalled w/ input
#this problem has a fixed intput length

def max24help(ints, time=[], rem = [])
  p 'X'
  max = {0=>2,1=>9,2=>5,3=>9}
  # binding.pry
  return format_time(time) if time.length == 4
  ints_less_than_max = ints.select do |el|
    if time.length == 1 && time[0] == 2
      el <= 3
    else
      el <= max[time.length]
    end
  end
  if ints_less_than_max.empty?
    if time.empty?
      return nil
    else
      rem << time.pop
      ints << rem.shift if rem.length > 1
    end
  else
    int = ints_less_than_max.pop
    ints.delete_at(ints.index(int) || ints.length)
    ints = ints.concat(rem).sort
    time << int
  end
  max24help(ints, time, rem)
end
