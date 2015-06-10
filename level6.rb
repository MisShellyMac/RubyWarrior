class Player

  attr_accessor :health, :hasHitBackWall

  def play_turn(warrior)

    # If we've never hit the back wall before, keep going backwards
    if !@hasHitBackWall
      # Check the space behind us
      space = warrior.feel(:backward)
      if space.empty? == true
        warrior.walk!(:backward)
      elsif space.captive? == true
        warrior.rescue!(:backward)
      elsif space.wall? == true
        # Once this is set, we will never do the backwards stuff again
        @hasHitBackWall = true
      end
    else
      # Check the forward space and do all the same logic from the last level
      space = warrior.feel
      if space.empty? == true
        if warrior.health == 20
          warrior.walk!
        elsif @health > warrior.health
          if warrior.health < 10
            # Unlike last time, walk backwards if our health is low enough so we can get out of the range of the arrows.
            # We can't do this every time, otherwise we never get close enough to attack the archer.
            warrior.walk!(:backward)
          else
            warrior.walk!
          end
        else
          warrior.rest!
        end
      elsif space.captive? == true
        warrior.rescue!
      else
        warrior.attack!
      end
    end
    @health = warrior.health
  end
end
  
