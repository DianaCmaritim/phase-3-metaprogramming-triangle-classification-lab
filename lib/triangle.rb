class Triangle
  #write code here
  attr_reader :side1, :side2, :side3

  def initialize(side1, side2, side3)
    @side1, @side2, @side3 = side1, side2, side3
    raise TriangleError, "Not a valid triangle" unless valid_triangle?
  end

  def kind
    return :equilateral if equilateral?
    return :isosceles if isosceles?
    return :scalene if scalene?
  end
#private methods
  private

  def valid_triangle?
    sides = [side1, side2, side3]
    return false if sides.include?(0)
    sides.sort!
    sides[0] + sides[1] > sides[2]
  end

  def equilateral?
    side1 == side2 && side2 == side3
  end

  def isosceles?
    side1 == side2 || side2 == side3 || side3 == side1
  end

  def scalene?
    side1 != side2 && side2 != side3 && side3 != side1
  end

  class TriangleError < StandardError;
  end
end
