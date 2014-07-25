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

	# definition
	# term

	def is_correct?
		# checks to see if guess is correct 
		# true/false
	end

	def show_definition
		# self.definition
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