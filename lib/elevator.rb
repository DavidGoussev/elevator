class Elevator

  attr_accessor :requests

  def initialize(requests=nil)
    @requests = requests
  end

  def direction
    currentfloor < requests[1].number ? 'up' : 'down'
  end

  def currentfloor
    requests.nil? ? 1 : requests.first.number
  end

  def elevatorcall
    sorted_requests.drop(1).each do |floor|
      floor.buttonpush = 'not pushed'
    end
    @requests = [sorted_requests.last]
  end

  private

  def sorted_requests
    if direction == 'down'
      @requests.sort!{|floor1, floor2| floor2.number <=> floor1.number }
    else
      @requests
    end
  end

end
