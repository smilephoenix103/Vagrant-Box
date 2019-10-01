require_relative 'human'

class Wizard < Human
  def initialize
    super
    @health = 50
    @intelligence = 25
  end

  def heal
    puts "Wizard healing..."
    @health += 10
    self
  end

  def fireball(target)
    puts "Shooting fireball"
    target.health -= 20
    self
  end
end

w1 = Wizard.new
w1.info
w1.heal
w1.info
