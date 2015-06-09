class Player
  def play_turn(warrior)
    space = warrior.feel
    if space.empty? == true
      if warrior.health == 20
        warrior.walk!
      else
        warrior.rest!
      end
    else
      warrior.attack!
    end
  end
end
