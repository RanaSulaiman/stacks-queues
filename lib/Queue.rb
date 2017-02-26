class Queue
  def initialize
    @store = []
  end

  def enqueue(element)
    @store.unshift(element)
  end

  def dequeue
    @store.pop
  end

  def front
    return @store.last
  end

  def size
    return @store.length
  end

  def empty?
    return @store.empty?
  end

  def to_s
    return @store.reverse.to_s
  end
end
