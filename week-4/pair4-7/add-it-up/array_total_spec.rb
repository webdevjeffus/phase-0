require_relative "my_solution"

describe 'total' do
  let(:array_1) { [1, 2, 3, 4, 5, 5, 7] }
  let(:array_2) { [4, 4, 5, 5, 6, 6, 6, 7] }

  it "is defined as a method" do
    expect(defined? total).to eq 'method'
  end

  it "requires a single argument" do
    expect(method(:total).arity).to eq 1
  end

  it "returns the correct total of array 1" do
    expect(total(array_1)).to eq 27
  end

  it "returns the correct total of array 2" do
    expect(total(array_2)).to eq 43
  end
end

describe 'sentence_maker' do
  let(:first_sentence) {["all", "my", "socks", "are", "dirty"]}
  let(:second_sentence) {["alaska", "has", "over", 586, "thousand", "miles"]}

  it "is defined as a method" do
    expect(defined? sentence_maker).to eq 'method'
  end

  it "requires a single argument" do
     expect(method(:sentence_maker).arity).to eq 1
  end

  it "returns the grammatically correct sentence of the first sentence" do
    expect(sentence_maker(first_sentence)).to eq "All my socks are dirty."
  end

  it "returns the grammatically correct sentence of the second sentence" do
    expect(sentence_maker(second_sentence)).to eq "Alaska has over 586 thousand miles."
  end
end