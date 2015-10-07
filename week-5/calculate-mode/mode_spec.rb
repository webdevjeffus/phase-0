require_relative "my_solution"

describe 'mode' do
  let(:array_1) { [1, 2, 3, 4, 5, 5, 7] }
  let(:array_2) { [4, 4, 5, 5, 6, 6, 6, 7, 5] }
  let(:array_3) { ["apple", "banana", "clementine", "banana", "cherry", "strawberry", "cherry"]}

  it "is defined" do
    expect(defined? mode).to eq 'method'
  end

  it "requires a single argument" do
    expect(method(:mode).arity).to eq 1

  end

  it "returns the correct mode when mode is a unique integer" do
    expect(mode(array_1)).to eq [5]
  end

  it "returns the correct mode when mode is not a unique integer" do
    expect(mode(array_2)).to eq [5,6]

  end

  it "returns the correct mode for strings" do
    expect(mode(array_3)).to eq ["banana", "cherry"]
  end
end