# Array extension

class Array
  
  # cluster element with keep order
  # accept binary predicate function
  # [1, 2, 2, 2].cluster { |a, b| a == b }
  # => [[1], [2, 2, 2]]
  def cluster &block
    self.inject([]) do |acc, item|
      if acc.empty?
        [[item]]
      else
        if block.call(acc[-1][-1], item)
          acc[-1] << item
        else
          acc << [item]
        end
        acc
      end
    end
  end

  # throw exception if list is empty
  def check_empty_list
    throw ":empty list" if self.empty?
  end

  # drop last one element 
  # [1, 2].tail 
  # => [2]
  def init
    check_empty_list
    self.take(self.length-1)
  end
  
  # drop one element 
  # [1, 2].tail 
  # => [2]
  def tail
    check_empty_list
    self.drop(1)
  end
  
  # take one element
  # [1, 2].head 
  # => 1
  def head
    self.first
  end
end

