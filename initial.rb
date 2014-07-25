require 'rainbow'
class Deck
	attr_accessor :card_array, :discarded_cards
	attr_reader :name

	def initialize (card_array)
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
	end
end

class Card
	attr_reader :definition, :term
	def initialize(definition, term)
		@definition = definition
		@term = term
	end

	def is_correct?(input)
		input.downcase == term.downcase
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

module DeckMaker
  def self.new_deck(parsed_card_data)
    self.load_deck(self.card_factory(parsed_card_data))
  end

  private
  def self.card_factory (parsed_card_data)
    card_objects = []
    parsed_card_data.each do |card|
      card_objects << Card.new(card[0], card[1])
    end
    card_objects
  end

  def self.load_deck (card_objects)
    Deck.new(card_objects)
  end
end

class View
	def get_input
		gets.chomp
	end
	def correct_response
		puts Rainbow("You, sir/madame, are correct.").green
		puts "*" * 50
	end

	def incorrect_response
		puts Rainbow("Sorry, but that's dead wrong. You can try again, though.").red
	end

	def welcome
		puts Rainbow("Welcome to the flash card deck that will school you. We'll give you a definition, and you provide the corresponding term.").blue
		puts "*" * 50
	end

	def game_over
		puts Rainbow("You've covered the whole deck. Congrats, you can go to the bar now.").blue
	end

	def clear_screen!
  	print "\e[2J"
	end

	def move_to_home!
  	print "\e[H"
	end
end

class Controller
	def initialize
		@view = View.new
		file = "nineties.txt" #ARGV[0]
		parsed_cards= ParseDeck.new
		card_array = parsed_cards.get_deck_array(file)
		@deck = DeckMaker.new_deck(card_array)

		run
	end

	def run
		input = ''
		@view.clear_screen!
		@view.move_to_home!
		@view.welcome
		@deck.shuffle_deck!
		until @deck.card_array.length == 0
			card = @deck.pick_card
			puts card.definition
			input = @view.get_input
			until card.is_correct?(input) || input == "skip"
					@view.incorrect_response
					input = @view.get_input
			end
			@view.correct_response unless input == 'skip'
			@deck.discard!
			sleep(1)
			@view.clear_screen!
			@view.move_to_home!
		end
		@view.game_over
	end
end

Controller.new
