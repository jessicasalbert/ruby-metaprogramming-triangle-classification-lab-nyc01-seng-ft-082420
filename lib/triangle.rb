class Triangle
  # write code here
  attr_accessor :s1, :s2, :s3

  def initialize(s1, s2, s3)
    @s1 = s1
    @s2 = s2
    @s3 = s3
  end

  def kind
    validate_triangle
    if s1 == s2 && s2 == s3
      :equilateral
    elsif s1 == s2 || s2 == s3 || s1 == s3
      :isosceles
    else
      :scalene
    end
  end

  def validate_triangle
    real_triangle = [s1 + s2 > s3, s1 + s3 > s2, s2 + s3 > s1]
    [s1, s2, s3].each do |side|
      if side == 0
        real_triangle << false
      end
    end
    if real_triangle.include?(false)
      raise TriangleError
    end
  end

  class TriangleError < StandardError
    def message
      "Triangle side values are invalid"
    end
  end

end
