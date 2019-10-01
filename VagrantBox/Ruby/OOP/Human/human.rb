class Human
  attr_accessor :strength, :intelligence, :stealth, :health

  def initialize
    @strength = 3
    @intelligence = 3
    @stealth = 3
    @health = 100
  end

  def attack(target)
    if target.class.ancestors.include?(Human)
      puts "Attacking target..."
      target.health -= 10
      true
    else
      puts "Target not Human"
      false
    end
    self
  end

  def info
    puts "Health: #{@health}\n Strength: #{@strength}\n Stealth: #{@stealth}\n Intelligence: #{intelligence}"
  end

  end

# h1 = Human.new
# h1.info
# h2 = Human.new
# r1 = 'rock'
# h2.attack(h1)
# p h1.health
# h1.attack(r1)
