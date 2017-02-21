require "player"

describe "Player" do
	before { @player = Player.new('Cyprian', "\u26AA") }

	describe "Assign and allow to read from Player class when:" do
		context "Player's name given" do
			it "Returns player's name" do
				expect(@player.name).to eql('Cyprian')
			end
		end

		context "Player's symbol given" do
			it "Returns player's symbol" do
				expect(@player.symbol).to eql("\u26AA")
			end
		end
	end
end