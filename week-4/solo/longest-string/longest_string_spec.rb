require_relative "my_solution"

describe 'longest_string' do
  it "returns nil when the array is empty ([])" do
    expect(longest_string([])).to be_nil
  end

  it "returns '' when that is the only element in the array" do
    expect(longest_string([''])).to eq ''
  end

  it "returns 'cat' when that is the only element in the array" do
    expect(longest_string(['cat'])).to eq 'cat'
  end

  it "returns the longest string regardless of what characters they contain" do
    expect(longest_string(['ZZZ', 'zzzzz'])).to eq 'zzzzz'
  end

  it "returns the 'aaaaaaa' with the example array" do
    expect(longest_string(['cat', 'aaaaaaa', 'apples'])).to eq 'aaaaaaa'
  end

  it "returns the longest string regardless of ordering" do
    # This creates an array containing ['a', 'aa', ...]
    # up to 10 characters long, but randomly ordered
    array = Array.new(10) { |i| 'a' * (i + 1) }.shuffle

    expect(longest_string(array)).to eq 'a'*10
  end
end