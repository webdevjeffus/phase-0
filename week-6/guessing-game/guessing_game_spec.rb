require_relative 'my_solution'

describe GuessingGame do
  let(:game) { GuessingGame.new(10) }

  describe '#initialize' do
    it "expects a single argument" do
      expect(GuessingGame.instance_method(:initialize).arity).to eq 1
    end
  end

  describe '#guess' do
    it "is defined" do
      expect(GuessingGame.method_defined?(:guess)).to be true
    end

    it "expects a single argument" do
      expect(GuessingGame.instance_method(:guess).arity).to eq 1
    end

    it "returns :high when the guess is too high" do
      expect(game.guess(100)).to eq :high
    end

    it "returns :low when the guess is too low" do
      expect(game.guess(0)).to eq :low
    end

    it "returns :correct when the guess is correct" do
      expect(game.guess(10)).to eq :correct
    end

    it "changes solved? when a correct guess is made" do
      expect { game.guess(10) }.to change(game, :solved?).from(false).to(true)
    end

    it "doesn't change solved? when an incorrect guess is made" do
      expect { game.guess(5) }.to_not change(game, :solved?).from(false)
    end

    it "reflects the last guess" do
      # This guess is correct, so game.solved? should be true
      game.guess(10)

      expect { game.guess(5) }.to change(game, :solved?).from(true).to(false)
    end
  end

  describe '#solved?' do
    it "is defined" do
      expect(GuessingGame.method_defined?(:solved?)).to be true
    end

    it "expects no arguments" do
      expect(GuessingGame.instance_method(:solved?).arity).to be_zero
    end

    it "returns false before a guess is made" do
      expect(game).to_not be_solved
    end
  end
end