
class Triangle
attr_accessor :side_one, :side_two, :side_three

def initialize(side_one, side_two, side_three)
  @side_one = side_one
  @side_two = side_two
  @side_three = side_three
end

def kind
  validate_triangle
  if @side_one != @side_two && @side_two != @side_three && @side_one != @side_three
    :scalene
  elsif @side_one == @side_two && @side_two != @side_three && @side_one != @side_three || @side_two == @side_three && @side_three != @side_one && @side_two != @side_one || @side_three == @side_one && @side_one != @side_two && @side_three != @side_two
    :isosceles
  elsif @side_one == @side_two && @side_two == @side_three
    :equilateral
  end
end

def validate_triangle
   real_triangle = [(@side_one + @side_two > @side_three), (@side_one + @side_three > @side_two), (@side_two + @side_three > @side_one)]
   [@side_one, @side_two, @side_three].each { |s| real_triangle << false if s <= 0 }
   raise TriangleError if real_triangle.include?(false)
 end

# def valid?
#   true if @side_one > 0 && @side_two > 0 && @side_three > 0 && @side_one + @side_two > @side_three && @side_two + @side_three > @side_one && @side_one + @side_three > @side_two
# end

class TriangleError < StandardError
end

end
