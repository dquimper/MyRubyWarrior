class Player

  def play_turn(warrior)
    init(warrior)
    @warrior = warrior

    if resting? and @warrior.health < @max_health
      rest!
    elsif not healthy?
      if @warrior.feel.enemy?
        walk!(:backward)
      else
        rest!
      end
    elsif warrior.feel.enemy? and healthy?
      attack!
    else
      walk!
    end

    perform_action
    deinit()
  end

  def perform_action
    case @last_action
      when :rest
        @warrior.rest!
      when :walk
        @warrior.walk!(@direction)
      when :attack
        @warrior.attack!(@direction)
    end
  end

  def resting?
    @last_action == :rest && @last_health < @warrior.health
  end

  def rest!
    @last_action = :rest
  end

  def walk!(direction = :forward)
    @last_action = :walk
    @direction = direction
  end

  def attack!(direction = :forward)
    @last_action = :attack
    @direction = direction
  end

  def init(warrior)
    return if @initialized

    @initialized = true
    @max_health = warrior.health
    @last_health = @max_health
  end

  def deinit
    @last_health = @warrior.health
  end

  def healthy?
    @warrior.health >= (@max_health * 0.5)
  end


  def debug(str)
    puts "DEBUG: #{str}"
  end
end

