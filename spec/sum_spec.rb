require_relative '../lib/solutions/SUM/sum.rb'

describe Sum do
  it 'returns the sum of two parameters' do
    sum = Sum.new
    expect(sum.sum(1,1)).to eq(2)
  end
end