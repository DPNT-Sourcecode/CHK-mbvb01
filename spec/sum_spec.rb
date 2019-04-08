require_relative '../lib/solutions/SUM/sum.rb'

describe Sum do

  before (:each) do
    @sum = Sum.new
  end

  it 'returns the sum of two parameters' do
    expect(@sum.sum(1,1)).to eq(2)
  end

  it 'raises an error if either parameter is negative' do
    expect{ @sum.sum(-1,1) }.to raise_error('Parameter is negative')
  end

  it 'raises an error if either parameter is greater than 100' do
    expect{ @sum.sum(101,1) }.to raise_error('Parameter is outside the accepted range')
  end
end