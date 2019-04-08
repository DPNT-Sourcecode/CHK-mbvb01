# noinspection RubyUnusedLocalVariable
class FizzBuzz

  def initialize
  @response = ''
  end

  def fizz_buzz(number)
    raise 'Input is outside the permited range' if number < 1 || number > 9999
    evaluate(number)
    return @response
    return 'fizz buzz deluxe' if fizz_buzz_deluxe?(number)
    return 'fizz buzz' if fizz_buzz?(number)
    return 'fizz deluxe' if fizz_deluxe?(number)
    return 'buzz deluxe' if buzz_deluxe?(number)
    return 'fizz' if fizz?(number)
    return @response if buzz?(number)
    return @response if deluxe?(number)
    return number.to_s
  end

  def evaluate(number)
    fizz(number)
    buzz(number)
    deluxe(number)
    if @response == ''
      @response = number.to_s
    end
    @response
  end

  def fizz(number)
    if (number % 3 == 0) || number.to_s.split('').include?('3')
      @response << 'fizz'
    end
  end

  def buzz(number)
    if (number % 5 == 0) || number.to_s.split('').include?('5')
      @response << 'buzz'
    end
  end

  def fizz_buzz?(number)
    return true if fizz?(number) && buzz?(number)
    return false
  end

  def deluxe?(number)
    if number > 10 && number.to_s.split('').uniq.length == 1
      if number % 2 == 0
        @response << 'deluxe'
      else 
        @response << 'fake deluxe'
      end
      return true
    else false
    end
  end

  def fizz_buzz_deluxe?(number)
    return true if fizz_buzz?(number) && deluxe?(number)
    return false
  end

  def fizz_deluxe?(number)
    return true if fizz?(number) && deluxe?(number)
    return false
  end

  def buzz_deluxe?(number)
    return true if buzz?(number) && deluxe?(number)
  end
end
