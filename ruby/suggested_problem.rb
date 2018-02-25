
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


#given an number of array, how many consecutive numbers do you need
#to sort so that the entire array is sorted.
# 1) Give you a set of numbers, generate all possible subsets.
def subsets(arr, n = arr.size-1)
  #Heaps permutations
  @sol = [] if n == arr.size - 1

  if n == 0
    p arr
    @sol << arr
    return arr
  else
    (n+1).times do |i|
      p i
      subsets(arr,n-1)
      if( (n - 1) % 2 == 1)
        arr[1],arr[n] = arr[n],arr[1]
      else
        arr[i],arr[n] = arr[n],arr[i]
      end
    end
  end
end
@sol = []

def perms (array, n = array.size-1)
    #case to jump off from recursion and return a permutation
    @sol = [] if n == array.size - 1
    if  n == 0
        @sol << array
        return array
    #else dig dipper
    else
        for i in 0..n do
            perms(array, n-1)
            if (n-1) % 2 == 1
                array[1], array[n] = array[n], array[1]
            else
                array[i], array[n] = array[n], array[i]
            end
        end
    end
end

# perms [1, 2, 3]
# perms [1, 2, 3,9]
# p @sol

# Give you a list of words, group all words that have the same pattern. Example:
# Input: {"mom", "eat", "ate","dad", "go" }
# Output: {"mom", "dad"}, {"eat", "ate"}, {"go"}
#Find the shorted path in a graph

#Given the fact that every train station is linked to 10 others, how many ways to reach a certain train station B from train station A

#There are articles on wiki with links to other articles, given a start article and end article, what is the least number of redirecting from the start article to the end article.
#What is the shortest distance between two nodes on graph?
#Graph traversals (shortest paths, BFS vs DFS analysis, etc.)
#Given an array, find the number of sequences [0:i] such that they have the first i natural numbers.

#Shortest amount of time it takes a frog to cross river given list of times when stone rises and how far frog can hop.
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

#will the result be different if bfs is started from 2 different nodes
#Sub sort an array in nlogn time, given the rest of the array is sorted.
# Second one was related to sorting cost or finding minimum number of replaces to sort.
#1.> Find a valid sub-sequence.
#the minimum steps to change a string to another string
#Given two strings, what is the minimum number of steps you must take to change it into another string of the same length? Each step consists of changing one letter and the resulting word must be in the English language.
#Frog and lillypod question - given array with times and locations on the path, find the first time the frog could cross.


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
