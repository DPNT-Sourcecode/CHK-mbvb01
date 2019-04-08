# noinspection RubyUnusedLocalVariable
class FizzBuzz

  def initialize
  @response = ''
  end

  def fizz_buzz(number)
    raise 'Input is outside the permited range' if number < 1 || number > 9999
    evaluate(number)
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
      if @response != ''
        @response << ' buzz'
      else
        @response << 'buzz'
      end
    end
  end

  def deluxe(number)
    if number > 10 && number.to_s.split('').uniq.length == 1
      if number % 2 == 0
        if @response != ''
          @response << ' deluxe'
        else
          @response << 'deluxe'
        end
      else
        if @response != ''
          @response << ' fake deluxe'
        else
          @response << 'fake deluxe'
        end
      end
    end
  end
end

