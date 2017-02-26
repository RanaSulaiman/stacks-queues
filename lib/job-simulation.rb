require './Stack.rb'
require './Queue.rb'

class JobSimulation
  #attr_reader :workers, :waiting, :roll

  def initialize (job_seekers)
    jobs_available = 6
    jobs_waiting = job_seekers - jobs_available

    @workers = Stack.new
    jobs_available.times do |i|
      @workers.push("Worker ##{ i + 1 }")
    end

    @waiting = Queue.new
    jobs_waiting.times do |i|
      @waiting.enqueue("Worker ##{ i + jobs_available + 1 }")
    end

  end

  def cycle
    roll = rand(1..6)
    puts "Cycling #{ roll } employees"
    roll.times do |i|
      @waiting.enqueue(@workers.pop)
    end

    roll.times do |i|
      @workers.push(@waiting.dequeue)
    end
  end

  def workers
    @workers.to_s
  end

  def waiting
    @waiting.to_s
  end
end

## Allows us to run our code and see what's happening:
sim = JobSimulation.new(10)
puts "------------------------------"
puts "Before the simulation starts"
puts "Employed: #{sim.workers}"
puts "Waitlist: #{sim.waiting}"
puts "------------------------------"
print "<enter to cycle>\n"

count = 0
until gets.chomp != ""
  puts "-------Cycle #{count+=1}-------"
  sim.cycle
  puts "Employed: #{sim.workers}"
  puts "Waitlist: #{sim.waiting}"
end


# Sample Run
# ------------------------------
# Before the simulation starts
# Employed: ["Worker #1", "Worker #2", "Worker #3", "Worker #4", "Worker #5", "Worker #6"]
# Waitlist: ["Worker #7", "Worker #8", "Worker #9", "Worker #10"]
# ------------------------------
# <enter to cycle>
#
# -------Cycle 1-------
# Cycling 1 employees
# Employed: ["Worker #1", "Worker #2", "Worker #3", "Worker #4", "Worker #5", "Worker #7"]
# Waitlist: ["Worker #8", "Worker #9", "Worker #10", "Worker #6"]
#
# -------Cycle 2-------
# Cycling 6 employees
# Employed: ["Worker #8", "Worker #9", "Worker #10", "Worker #6", "Worker #7", "Worker #5"]
# Waitlist: ["Worker #4", "Worker #3", "Worker #2", "Worker #1"]
#
# -------Cycle 3-------
# Cycling 6 employees
# Employed: ["Worker #4", "Worker #3", "Worker #2", "Worker #1", "Worker #5", "Worker #7"]
# Waitlist: ["Worker #6", "Worker #10", "Worker #9", "Worker #8"]
#
# -------Cycle 4-------
# Cycling 2 employees
# Employed: ["Worker #4", "Worker #3", "Worker #2", "Worker #1", "Worker #6", "Worker #10"]
# Waitlist: ["Worker #9", "Worker #8", "Worker #7", "Worker #5"]
#
# -------Cycle 5-------
# Cycling 2 employees
# Employed: ["Worker #4", "Worker #3", "Worker #2", "Worker #1", "Worker #9", "Worker #8"]
# Waitlist: ["Worker #7", "Worker #5", "Worker #10", "Worker #6"]
