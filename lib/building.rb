require './floor'
require './elevator'

class Building
  attr_accessor :elevator, :floors


  def initialize(top_floor)
    # in example, top_floor = 20, elevator count = 1
    @elevator = Elevator.new
    @floors = []
    floorcount = 1

    top_floor.times do
      @floors << Floor.new(floorcount)
      floorcount += 1
    end
  end

  def req_elevator
    elevator_requests
    @elevator_requests = elevator_requests
  end

private

  def elevator_requests
    elevator_requests = []
    floors.each{|floor| elevator_requests << floor if @elevator_currentfloor == floor.number}
    floors.each{|floor| elevator_requests << floor if floor.buttonpush == 'pushed'}
    elevator_requests
  end

end
