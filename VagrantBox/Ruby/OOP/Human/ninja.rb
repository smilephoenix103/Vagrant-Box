require_relative 'human'

class Ninja < Human
  def initialize
    super
    @stealth = 175
  end

  def steal(target)
    target.health -= 15
    @health += 15
    self
  end

  def get_away
  end

end

n1 = Ninja.new
n1.info

n2 = Ninja.new
n2.steal(n1)
n1.info
