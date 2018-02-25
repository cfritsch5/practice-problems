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
