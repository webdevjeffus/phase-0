require_relative "my_solution"

describe "pad!" do
  let!(:empty_array)  { [] }
  let!(:array)        { [1,2,3] }
  let!(:long_array)   { [1,2,3]*10 }
  let!(:random_array) { (1..1+rand(100)).map { rand(10) } }

  let!(:all_arrays)   { [empty_array, array, long_array, random_array] }

  it "operates destructively" do
     expect(pad!(array, 10).object_id).to eq(array.object_id)
  end

  it "doesn't pad a long array" do
    expect(pad!(long_array, 10).length).to eq 30
  end
end

describe "pad" do
  let!(:empty_array)  { [] }
  let!(:array)        { [1,2,3] }
  let!(:long_array)   { [1,2,3]*10 }
  let!(:random_array) { (1..1+rand(100)).map { rand(10) } }

  let!(:all_arrays)   { [empty_array, array, long_array, random_array] }

  it "operates non-destructively" do
    all_arrays.each do |array|
      expect(pad(array, 0).object_id).to_not eq(array.object_id)
    end
  end

  it "pads elements to the end of an array" do
    all_arrays.each do |array|
      pad_size = 1 + rand(50)
      expect(pad(array, array.length + pad_size, 'apple')).to eq(array + Array.new(pad_size, 'apple'))
    end
  end

  it "doesn't pad when minimum size is equal to the array's length" do
    all_arrays.each do |array|
      expect(pad(array, array.length)).to eq(array)
    end
  end

  it "doesn't pad when the minimum size is 0" do
    all_arrays.each do |array|
      expect(pad(array, 0)).to eq(array)
    end
  end

  it "pads with nil by default" do
    expect(pad(empty_array, 2)).to eq([nil, nil])
  end

  it "can pad with a string" do
    expect(pad(empty_array, 2, 'apple')).to eq(['apple', 'apple'])
  end

  it "can pad with an object" do
    expect(pad(empty_array, 2, {})).to eq([{}, {}])
  end
end