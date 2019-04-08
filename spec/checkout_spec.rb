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

  it 'returns -1 if the provided sku doesnt exist' do
    expect(@checkout.checkout('-')).to eq (-1)
  end

  it 'returns 130 if passed AAA' do
    expect(@checkout.checkout('AAA')).to eq (130)
  end

  it 'returns 180 when passed AAAA' do
    expect(@checkout.checkout('AAAA')).to eq (180)
  end

  it 'returns 260 when passed AAAAAA' do
    expect(@checkout.checkout('AAAAAA')).to eq (260)
  end
end