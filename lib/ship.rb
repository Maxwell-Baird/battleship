class Ship

  attr_reader :health, :name




  def hit
    @health -= 1
  end
end
