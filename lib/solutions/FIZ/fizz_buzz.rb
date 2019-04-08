# noinspection RubyUnusedLocalVariable
class FizzBuzz

  def fizz_buzz(number)
    raise 'Input is outside the permited range' if number < 1 || number > 9999
    return 'fizz buzz' if fizz_buzz?(number)
    return 'fizz' if fizz?(number)
    return 'buzz' if buzz?(number)
    return number.to_s
  end

  def fizz?(number)
    return true if (number % 3 == 0) || number.to_s.split('').include?('3')
    return false
  end

  def buzz?(number)
    return true if (number % 5 == 0) || number.to_s.split('').include?('5')
    return false
  end

  def fizz_buzz?(number)
    return true if fizz?(number) && buzz?(number)
    return false
  end

end


