require_relative "my_solution"

describe 'good_guess?' do
  it 'is defined as a method' do
    expect(defined?(good_guess?)).to eq 'method'
  end
  it 'returns true for a guess of 42' do
    expect(good_guess?(42)).to be true
  end
  it 'returns false for a guess not equal to 42' do
    input = rand(41)
    expect(good_guess?(input)).to be false
  end
end