require_relative '../lib/solutions/HLO/hello'

describe Hello do
  before :each do
    @hello = Hello.new
  end

  it 'returns Hello World' do
    expect(@hello.hello('World')).to eq 'Hello, World'
  end

  it 'returns a hello message containing the supplied name' do
    expect(@hello.hello('James')).to eq 'Hello, James'
  end

end