module MyEnumerable
  def my_each
    for i in 0...size
      yield self[i]
    end
    self
  end
end

class Array
  include MyEnumerable
end

[1,2,3,4].my_each {|i| puts i}
[1,2,3,4].my_each {|i| puts i * 10}
