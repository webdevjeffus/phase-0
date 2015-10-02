require_relative "my_solution"

describe 'array_concat' do
  it "is defined as a method" do
    expect(defined?(array_concat)).to eq 'method'
  end

  it "requires two arguments" do
    expect(method(:array_concat).arity).to eq 2
  end

  it "returns an empty array if both arrays are empty" do
    expect(array_concat([], [])).to eq []
  end

  it "returns [1,1] for arguments [1], [1]" do
    expect(array_concat([1], [1])).to eq [1,1]
  end

  it "returns ['cat', 1, 2]" do
    expect(array_concat(['cat', 1], [2])).to eq ['cat', 1, 2]
  end
end