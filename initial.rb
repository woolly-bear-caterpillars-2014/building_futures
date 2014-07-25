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

module ParseDeck
	# parse deck from CSV file
end

# user sees definition
# enters guess
# check if guess is correct
# 	- move to next if correct
# 	- repropose same definition
#


case guess
when is_correct?
	return correct #from view
	deck.discard!

when is_correct? == false ||
	return try_again #from view
end


