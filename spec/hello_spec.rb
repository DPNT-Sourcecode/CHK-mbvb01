require_relative '../lib/solutions/HLO/hello'

describe Hello do
  before :each do
    @hello = Hello.new
  end

  it 'returns Hello World' do
    expect(@hello.hello('World')).to eq 'Hello, World'
  end

end