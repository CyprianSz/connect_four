require "board"

describe "Board" do
	before { @board = Board.new }

	describe "For choosen place on board:" do
			it "Allows to assign value" do
				@board.board[:A1] = "\u26AB"
				expect(@board.board[:A1]).to eql("\u26AB")
			end

			it "Reads value" do
				expect(@board.board[:AA]).to eql(" A ")
			end
	end
end