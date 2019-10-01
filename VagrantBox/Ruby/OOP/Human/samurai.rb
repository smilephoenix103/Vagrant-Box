require_relative 'human'

class Samurai < Human
  @@num_samurais = 0

  def initialize
    super
    @health = 200
    @@num_samurais += 1
  end

  def death_blow(target)
    puts "Dealing death blow..."
    target.health = 0
    self
  end

  def meditate
    puts "Sumarai meditating..."
    @health = 200
    self
  end

  def how_many
    p "There are #{@@num_samurais} samurai(s)"
    self
  end

end

s1 = Samurai.new
s2 = Samurai.new
s1.info
s1.death_blow(s2)
s2.info
s1.how_many
