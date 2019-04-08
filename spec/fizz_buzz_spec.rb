require_relative '../lib/solutions/FIZ/fizz_buzz'

describe FizzBuzz do

before :each do
  @fizzBuzz = FizzBuzz.new
end

it 'returns fizz if a number is divisible by 3' do
  expect(@fizzBuzz.fizz_buzz(3)).to eq 'fizz'
end

it 'returns buzz if a number is divisible by 5' do
  expect(@fizzBuzz.fizz_buzz(5)).to eq 'buzz'
end

it 'returns fizz buzz if a number is divisible by 3 and 5' do
  expect(@fizzBuzz.fizz_buzz(15)).to eq 'fizz buzz'
end

it 'returns the provided number as a string if not divisible by 3/5/15' do
  expect(@fizzBuzz.fizz_buzz(1)).to eq '1'
end

it 'raises an error if the provided number is outside the range 1-9999' do
  expect{ @fizzBuzz.fizz_buzz(0) }.to raise_error 'Input is outside the permited range'
  expect{ @fizzBuzz.fizz_buzz(10000) }.to raise_error 'Input is outside the permited range'
end

end