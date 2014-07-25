class View
  def get_input
    gets.chomp
  end

  def correct_response
    puts "You, sir/madame, are correct."
    puts "*" * 20
  end

  def incorrect_response
    puts "Sorry, but that's dead wrong. You can try again, though."
  end

  def welcome
    puts "Welcome to the flash card deck that will school you. We'll give you a definition, and you provide the corresponding term."
    puts "*" * 20
  end

  def game_over
    puts "You've covered the whole deck. Congrats, you can go to the bar now."
  end
end

case guess
when is_correct?
  return correct #from view
  deck.discard!

when is_correct? == false ||
  return try_again #from view
end

def clear_screen!
  print "\e[2J"
end
