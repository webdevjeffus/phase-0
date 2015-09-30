require_relative "my_solution"

describe 'do_something' do
  it 'is defined as a method' do
    expect(defined?(do_something)).to eq 'method'
  end
  it 'should accept exactly three parameters passed to the method' do
    expect(method(:do_something).arity).to eq 3
  end
end