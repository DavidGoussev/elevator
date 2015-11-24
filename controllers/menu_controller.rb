class MenuController

  def main_menu
    puts "welcome to the elevator"

    @current_floor = 0
    @direction = 1
    @primary_requests = Array.new
    @secondary_requests = Array.new

    thr = Thread.new do
      while true do
        puts "I am at floor #{@current_floor}"
        puts "This is my direction #{@direction}"
        puts "This is where i'm headed #{@primary_requests.first}" if @primary_requests.count > 0
        #dropping off passengers
        # puts "hello"
        while @primary_requests.count > 0 && @primary_requests.first == @current_floor
          # puts "hello.5"
          puts "droppped off passenger at #{@primary_requests.first}"
          @primary_requests.shift
        end
        # puts "hello2"

        if @primary_requests.count == 0
          # puts "hello3"
          @primary_requests = @secondary_requests
          @secondary_requests = Array.new
          # puts "hello3.5"
          if @primary_requests.count == 0
            @direction = 0
          else
            @direction = @primary_requests.first > @current_floor ? 1 : -1
          end
        elsif @direction == 0
          # puts "hello4"
          @direction = @primary_requests.first > @current_floor ? 1 : -1
        end

        # puts "testing2"
        @current_floor += @direction
        # puts "testing3"
        sleep 1

      end
    end

    while true
      selection = gets.to_i
      if @direction == 1 && selection >= @current_floor || @direction == -1 && selection <= @current_floor
        @primary_requests << selection
        if @direction == 1
          @primary_requests.sort!{|floor1, floor2| floor1 <=> floor2}
        elsif @direction == -1
          @primary_requests.sort!{|floor1, floor2| floor2 <=> floor1 }
        end
      else
        @secondary_requests << selection

        if @direction == 1
          @secondary_requests.sort!{|floor1, floor2| floor2 <=> floor1 }
        elsif @direction == -1
          @secondary_requests.sort!{|floor1, floor2| floor1 <=> floor2 }
        end
      end
      puts "You picked #{selection}"
    end

  end

end
