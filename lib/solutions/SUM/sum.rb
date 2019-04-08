# noinspection RubyUnusedLocalVariable
class Sum

  def sum(x, y)
    raise 'Parameter is negative' if x < 0 || y < 0
    raise 'Parameter is outside the accepted range' if x > 100 || y > 100
    return x + y
  end

end
