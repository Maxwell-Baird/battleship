class Ship
  attr_reader :length, :health, :name

  def initialize(name_parameter, length_parameter)
    @name = name_parameter
    @length = length_parameter
    @health = length_parameter
  end

  def hit
    @health = @health - 1
  end

  def sunk?
    if @health <= 0
      true
    else
      false
    end
  end

end
