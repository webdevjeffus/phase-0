require_relative "my_solution"

describe "make_address" do
  it 'is defined as a method' do
    expect(defined?(make_address)).to eq 'method'
  end

  it 'accepts four parameters' do
    expect(method(:make_address).arity).to eq 4
  end

  it 'returns the properly formatted address string' do
    output_string = "You live at 633 Folsom St., in the beautiful city of San Francisco, CA. Your zip is 94107."
    expect(make_address("633 Folsom St.","San Francisco","CA","94107")).to eq output_string
  end
end