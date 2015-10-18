require_relative 'my_solution'

describe CreditCard do
  describe '#initialize' do
    it 'Expects a single argument for the card' do
      expect(CreditCard.instance_method(:initialize).arity).to eq 1
    end

    it 'raises ArgumentError on card > 16' do
      expect { CreditCard.new(11111111111111112) }.to raise_error(ArgumentError)
    end

    it 'raises ArgumentError on card < 16' do
      expect { CreditCard.new(1) }.to raise_error(ArgumentError)
    end
  end

  describe '#check_card' do
    it 'expects no arguments to be passed' do
      expect(CreditCard.instance_method(:check_card).arity).to be_zero
    end

    it 'returns true for a valid card' do
      card = CreditCard.new(4408041234567901)
      expect(card.check_card).to eq true
    end

    it 'returns false for a bad card' do
      card = CreditCard.new(4408041234567906)
      expect(card.check_card).to eq false
    end
  end
end