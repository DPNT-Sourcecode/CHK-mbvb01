require_relative '../lib/solutions/SUM/sum.rb'

describe Sum do

  before (:each) do
    @sum = Sum.new
  end

  it 'returns the sum of two parameters' do
    expect(@sum.sum(1,1)).to eq(2)
  end

  it 'raises an error if either parameter is negative' do
    expect(@sum.sum(-1,1)).to raise_error
  end
end