require "byebug"
@is_script = __FILE__ == $PROGRAM_NAME
my_string = "I am running the script"


def print_my_string(string)
  debugger unless @is_script
  print string
end

if @is_script
  print_my_string(my_string)
end

# ~$ ruby -r byebug display_demo.rb


class Array
  def my_each(&blk)
    (self.length).times do |i|
      blk.call(self[i])
    end
  end
end

class Array
  def my_while_each(&blk)
    i = 0
    while i < self.length
      blk.call(self[i])
      i += 1
    end
  end
end

class Array
  def my_select(&blk)
    new_arr = []
    self.my_each do |el|
      new_arr.push(el) if blk.call(el)
    end
    new_arr
  end
end

class Array
  def my_reject(&blk)
    new_arr = []
    self.my_each do |el|
      new_arr.push(el) unless blk.call(el)
    end
    new_arr
  end
end
