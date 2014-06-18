# Imagine a school that has 100 closed lockers and 100 students standing in line. The 1st student goes through and opens every locker, the 2nd student closes every 2nd locker, and the 3rd student toggles every 3rd locker. If the remaining students go through, likewise, and toggle the state of any locker that is a multiple of their number in line, what lockers are open at the end?
#
# Print locker numbers from 1-100, as well as its final state ("open" or "closed").

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
