# require 'pry'

class Deck

	# card_array
	# name_of_deck
	# discarded

	def shuffle_deck
		# shuffles deck
	end

	def pick_card
		# returns last card obj
	end

	def discard!
		# pop to discarded array
	end

end

class Card
	attr_reader :definition, :card
	def initialize
		@definition = definition
		@term = term
	end

	def is_correct?(guess)
		guess.downcase == term.downcase
	end

	def show_definition
		self.definition
	end
end

class ParseDeck
	def get_deck_array(file)
		file = File.open(file, "r")
		# binding.pry
		contents = file.read
		# binding.pry
		strings = contents.split("\n")
		strings.delete_if{ |words| words == ""}
		strings.each_slice(2).to_a
	end
end

# user sees definition
# enters guess
# check if guess is correct
# 	- move to next if correct
# 	- repropose same definition
#


# case guess
# when is_correct?
# 	return correct #from view
# 	deck.discard!

# when is_correct? == false ||
# 	return try_again #from view
# end

file = "flashcard_samples.txt"
deck = ParseDeck.new
print deck.get_deck_array(file)
