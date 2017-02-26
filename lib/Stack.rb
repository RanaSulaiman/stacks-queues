class Stack
  def initialize
    @store = Array.new
  end

  def push(element)
    @store.push(element)
    # or @store.unshift(element), or any method we want 
  end

  def pop
   return @store.pop
  end

  def top
    return @store.last
  end

  def size
    return @store.length
  end

  def empty?
    #or return size == 0
    #or @store.length == 0
    return @store.empty?
  end

  def to_s
    return @store.to_s
  end
end
