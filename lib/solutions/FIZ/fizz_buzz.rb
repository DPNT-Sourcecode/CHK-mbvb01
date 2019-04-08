# noinspection RubyUnusedLocalVariable
class FizzBuzz

  def fizz_buzz(number)
    return 'fizz buzz' if (number % 15 == 0)
    return 'fizz' if (number % 3 == 0)
    return 'buzz' if (number % 5 == 0)
  end

end
