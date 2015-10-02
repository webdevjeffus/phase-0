require_relative "my_solution"

describe 'welcome' do
  it 'is defined as a method' do
    expect(defined?(welcome)).to eq 'method'
  end
  it 'accepts an address as a single parameter' do
    expect(method(:welcome).arity).to eq 1
  end
  it 'returns "Welcome to California" if the address contains "CA"' do
    expect(welcome("a string with CA in it")).to eq "Welcome to California"
  end
  it 'returns "You should move to California" if the address does not contain "CA"' do
    expect(welcome("nothing like cali in here")).to eq "You should move to California"
  end
end