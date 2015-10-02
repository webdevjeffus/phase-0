require_relative "my_solution"

describe 'valid_triangle?' do
  it "is defined as a method" do
    expect(defined?(valid_triangle?)).to eq 'method'
  end

  it "expects 3 arguments" do
    expect(method(:valid_triangle?).arity).to eq 3
  end

  it "returns true for an equilateral triangle" do
    length = rand(0.01..100.0)
   expect(valid_triangle?(length, length, length)).to be true
  end

  it "returns false if any of the arguments are 0" do
    # [0, 1, 1].permutation(3) returns all permutations of [0, 1, 1]
    length = rand(0.01..100.0)
    expect([0, length, length].permutation(3).all? { |(a,b,c)| valid_triangle?(a,b,c) }).to be false
  end

  let(:random_isoceles) do
    equal_length = rand(1.0..100.0)
    other_length = rand(1.0..2*equal_length)

    [equal_length, equal_length, other_length]
  end

  let(:isoceles_triangles) { [random_isoceles, [1,1,0.01], [5,5,9]] }
  it "returns true for an isoceles triangle" do
    expect(isoceles_triangles.all? do |triangle|
      triangle.permutation(3).all? { |(a,b,c)| valid_triangle?(a,b,c) }
    end).to be true
  end

  let(:pythagorean_triples) { [[3,4,5], [65, 72, 97], [115, 252, 277], [120, 209, 241]] }
  it "returns true for every permutation of a Pythagorean triple" do
    expect(pythagorean_triples.all? do |triple|
      triple.permutation(3).all? { |(a,b,c)| valid_triangle?(a,b,c) }
    end).to be true
  end

  let(:invalid_triangles) { [[1, 1, 2.01], [50, 70, 200]] }
  it "returns false for any impossible triangle" do
    expect(invalid_triangles.all? do |triple|
      triple.permutation(3).all? { |(a,b,c)| !valid_triangle?(a,b,c) }
    end).to be true

    # If you're reading this, be careful.  The to be_true throws people off.
    # This whole statement returns true if and only if valid_triangle? returns false
    # for every permutation of [1, 1, 2.01], which is what we're testing.
  end
end