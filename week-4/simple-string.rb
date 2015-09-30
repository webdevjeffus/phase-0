# Solution Below

old_string = "Ruby is cool"

new_string = old_string.reverse.upcase

# RSpec Tests. They are included in this file because the local variables you are creating are not accessible across files. If we try to run these files as a separate file per normal operation, the local variable checks will return nil.


describe "old_string" do
  it 'is defined as a local variable' do
    expect(defined?(old_string)).to eq 'local-variable'
  end

  it "has the value 'Ruby is cool'" do
    expect(old_string).to eq "Ruby is cool"
  end
end

describe 'new_string' do
  it 'is defined as a local variable' do
    expect(defined?(new_string)).to eq 'local-variable'
  end

  it 'has the value "LOOC SI YBUR"' do
    expect(new_string).to eq "LOOC SI YBUR"
  end
end