class Deck
	attr_accessor :card_array, :discarded_cards
	attr_reader :name

	def initialize (name, card_array)
		@card_array = card_array
		@name = name
		@discarded_cards = []
	end

	def shuffle_deck!
		self.card_array.shuffle!
	end

	def pick_card
		card_array.last
	end

	def discard!
		discarded_card = self.card_array.pop
		self.discarded_cards << discarded_card
		discarded_card
	end

end

class Card

	def initialize
		# definition
		# term
	end

	def is_correct?
		# checks to see if guess is correct
		# true/false
	end

	def show_definition
		# self.definition
	end

end

module ParseDeck
end
	# parse deck from CSV file
end

# user sees definition
# enters guess
# check if guess is correct
# 	- move to next if correct
# 	- repropose same definition
#
