require_relative "my_solution"

describe 'shortest_string' do
  it "returns nil when the array is empty ([])" do
    expect(shortest_string([])).to be_nil
  end

  it "returns '' when that is the only element in the array" do
    expect(shortest_string([''])).to eq ''
  end

  it "returns 'cat' when that is the only element in the array" do
    expect(shortest_string(['cat'])).to eq 'cat'
  end

  it "returns 'cat' with the example array" do
    expect(shortest_string(['cat', 'zzzzzzz', 'apples'])).to eq 'cat'
  end

  it "returns the shortest string regardless of ordering" do
    # This creates an array containing ['a', 'aa', ...]
    # up to 10 characters long, but randomly ordered
    array = Array.new(10) { |i| 'a' * (i + 1) }.shuffle

    expect(shortest_string(array)).to eq 'a'
  end
end