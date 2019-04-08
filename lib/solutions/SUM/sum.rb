# noinspection RubyUnusedLocalVariable
class Sum

  def sum(x, y)
    raise 'Parameter is negative' if x < 0 || y < 0
    return x + y
  end

end
