# noinspection RubyUnusedLocalVariable
class FizzBuzz

  def fizz_buzz(number)
    raise 'Input is outside the permited range' if number < 1 || number > 9999
    return 'fizz buzz' if (number % 15 == 0)
    return 'fizz' if (number % 3 == 0) || number.to_s.split.include?('3')
    return 'buzz' if (number % 5 == 0)
    return number.to_s
  end

end
