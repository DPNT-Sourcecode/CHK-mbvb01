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

  it 'returns 250 when passed AAAAAA' do
    expect(@checkout.checkout('AAAAAA')).to eq (250)
  end

  it 'returns 45 when pass BB' do
    expect(@checkout.checkout('BB')).to eq (45)
  end

  it 'returns 45 when pass BB' do
    expect(@checkout.checkout('BBB')).to eq (75)
  end

  it 'returns 45 when pass BB' do
    expect(@checkout.checkout('BBBB')).to eq (90)
  end

  it 'returns 80 when passed EE' do
    expect(@checkout.checkout('EE')).to eq (80)
  end

  it 'returns 80 when passed EEB' do
    expect(@checkout.checkout('EEB')).to eq (80)
  end

  it 'returns 110 when passed EEBB' do
    expect(@checkout.checkout('EEBB')).to eq (110)
  end

  it 'returns 200 when passed AAAAA' do
    expect(@checkout.checkout('AAAAA')).to eq (200)
  end

  it 'returns 300 when passed AAAAAAA' do
    expect(@checkout.checkout('AAAAAAA')).to eq (300)
  end

  it 'returns 330 when passed AAAAAAAA' do
    expect(@checkout.checkout('AAAAAAAA')).to eq (330)
  end

  it 'returns 380 when passed AAAAAAAAA' do
    expect(@checkout.checkout('AAAAAAAAA')).to eq (380)
  end

  it 'returns 160 when passed EEEEBB' do
    expect(@checkout.checkout('EEEEBB')).to eq (160)
  end

  it 'returns 20 when passed FFF' do
    expect(@checkout.checkout('FFF')).to eq (20)
  end

  it'returns 45 when passed STX' do
    expect(@checkout.checkout('STX')).to eq (45)
  end

  it'returns 45 when passed XYZ' do
    expect(@checkout.checkout('XYZ')).to eq (45)
  end

  it'returns 21 when passed Z' do
    expect(@checkout.checkout('Z')).to eq (21)
  end

  it'returns 45 when passed SSS' do
    expect(@checkout.checkout('SSS')).to eq (45)
  end

  it'returns 65 when passed SSSZ' do
    expect(@checkout.checkout('SSSZ')).to eq (65)
  end
end