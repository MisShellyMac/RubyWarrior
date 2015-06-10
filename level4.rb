class Player

  attr_accessor :health

  def play_turn(warrior)
    space = warrior.feel
    if space.empty? == true
      if warrior.health == 20
        warrior.walk!
      elsif @health > warrior.health
        warrior.walk!
      else
        warrior.rest!
      end
    else
      warrior.attack!
    end
    @health = warrior.health
  end
end
