require_relative "my_solution"

describe 'factorial' do
  it "returns 1 with 0 as an argument" do
    expect(factorial(0)).to eq 1
  end

  it "returns 1 with 1 as an argument" do
    expect(factorial(1)).to eq 1
  end

  it "calculates 10!" do
    expect(factorial(10)).to eq 3628800
  end

  it "calculates 20!" do
    expect(factorial(20)).to eq 2432902008176640000
  end

  it "is divisible by 1000 if given an argument >= 1000" do
    num = 1000 + rand(10000)
    expect((factorial(1000) % 1000)).to be_zero
  end
end