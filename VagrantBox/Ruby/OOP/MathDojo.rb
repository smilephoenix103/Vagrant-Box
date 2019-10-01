class MathDojo
  attr_accessor :total
  def initialize
    @total = 0
  end

  def add(*nums)
    if nums.class == Array
      @total += nums.flatten.reduce(:+)
    else
      @total += nums
    end
    self
  end

  def subtract(*nums)
    if nums.class == Array
      @total -= nums.flatten.reduce(:+)
    else
      @total -=nums
    end
    self
  end

  def result
    puts @total.round(2)
    self
  end
end

challenge1 = MathDojo.new.add(2).add(2, 5).subtract(3, 2).result # => 4
challenge2 = MathDojo.new.add(1).add([3, 5, 7, 8], [2, 4.3, 1.25]).subtract([2,3], [1.1, 2.3]).result # => 23.15
