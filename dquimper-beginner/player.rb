class Player

  def play_turn(warrior)
    init(warrior)

    if not healthy?(warrior)
      if warrior.feel.enemy?
        warrior.walk!(:backward)
        return
      else
        warrior.rest!
        return
      end
    end

    if warrior.feel.enemy? and healthy?(warrior)
      warrior.attack!
      return
    end

    warrior.walk!
  end

  def init(warrior)
    return if @initialized

    @initialized = true
    @max_health = warrior.health
  end


  def healthy?(warrior)
    warrior.health >= (@max_health * 0.7)
  end


  def debug(str)
    puts "DEBUG: #{str}"
  end
end

