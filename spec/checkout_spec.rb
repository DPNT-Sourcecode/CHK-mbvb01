require_relative '../lib/solutions/CHK/checkout'

describe Checkout do

  before :each do
    @checkout = Checkout.new
  end

  it 'returns the value of the passed skus' do
    expect(@checkout.checkout('AAB')).to eq (130)  
  end

  it 'returns 0 when passed a blank string' do
    expect(@checkout.checkout('')).to eq (0)
  end

  it 'returns the expected value for lowercase entry' do
    expect(@checkout.checkout('a')).to eq (50)
  end
end