require_relative "bike"

class DockingStation
  CAPACITY = 20
  attr_accessor :capacity

  def initialize
    @bikes = []
    @capacity = CAPACITY
  end

  def release_bike bike
    fail "No bike available" if empty?
    fail "Bike is broken" if bike.working? == false
    bikes.delete(bike)
  end

  def dock bike
    fail "Docking station is full" if full?
    bikes.push bike
  end

  private

  attr_accessor :bikes

  def empty?
    bikes.count == 0
  end

  def full?
    bikes.count >= capacity
  end
end
