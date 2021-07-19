require "pry"

class Triangle
  def initialize(side1, side2, side3)
    @sides = []
    @sides << side1
    @sides << side2
    @sides << side3
  end

  def triangle_legal
    if @sides.any? { |num| num <= 0 } == true
      false
    elsif @sides[0] + @sides[1] <= @sides[2] or @sides[0] + @sides[2] <= @sides[1] or @sides[1] + @sides[2] <= @sides[0]
      false
    else
      true
    end
  end

  def kind
    if triangle_legal() != true
      raise TriangleError
    else
      if @sides.uniq.size == 1
        :equilateral
      elsif @sides.uniq.size == 2
        :isosceles
      elsif @sides.uniq.size == 3
        :scalene
      end
    end
  end

  class TriangleError < StandardError
    def message
      "This triangle is illegal!"
    end
  end
end
