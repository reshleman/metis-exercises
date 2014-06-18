class LockerProblem
  def initialize
    @lockers = Array.new(101, "closed")
    @lockers[0] = nil
  end

  def solve
    1.upto(100) do |student_index|
      1.upto(100) do |locker_index|
        if locker_index % student_index == 0
          toggle_locker(locker_index)
        end
      end
    end
    print_result
  end

  private

  attr_reader :lockers

  def toggle_locker(locker_index)
    if(lockers[locker_index]) == "open"
      lockers[locker_index] = "closed"
    else
      lockers[locker_index] = "open"
    end
  end

  def print_result
    1.upto(100) do |locker_index|
      puts "#{locker_index}. #{lockers[locker_index]}"
    end
  end
end

LockerProblem.new.solve
