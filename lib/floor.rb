class Floor
  attr_accessor :buttonpush, :number

  def initialize(number)
    @buttonpush = 'not pushed'
    @number = number
  end

end
