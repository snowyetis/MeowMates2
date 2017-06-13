class Queue::High
  @queue = :high

  def self.enqueue(object, method, *args)
    # ...to be continued
  end

  def self.perform
    # ...to be continued
  end
end

# app/models/queue/normal.rb
class Queue::Normal
  @queue = :normal

  def self.enqueue(object, method, *args)
    # ...to be continued
  end

  def self.perform
    # ...to be continued
  end
end

# app/models/queue/low.rb
class Queue::Low
  @queue = :low

  def self.enqueue(object, method, *args)
    # ...to be continued
  end

  def self.perform
    # ...to be continued
  end
end

# Queue::Normal.enqueue(some_object, :some_method, { 'some_arg' => 1, 'some_other_arg' => 2 })
#
# Queue::High.enqueue(some_object, :some_really_imporant_method, { 'some_arg' => 1, 'some_other_arg' => 2 })
#
# Queue::Low.enqueue(some_object, :some_method_that_can_take_its_time, { 'some_arg' => 1, 'some_other_arg' => 2 })
