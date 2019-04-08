require_relative '../lib/solutions/FIZ/fizz_buzz'

describe FizzBuzz do

before :each do
  @fizzBuzz = FizzBuzz.new
end

it 'returns fizz if a number is divisible by 3' do
  expect(@fizzBuzz.fizz_buzz(3)).to eq 'fizz'
end

end