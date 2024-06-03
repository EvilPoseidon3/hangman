# when game is created make a loop that displays the board and ask for a guess input
    #
#take the guess input and and check it with the the board then update the board
    #
#after the board has been updated request another input and so forth
    #
require_relative 'hangmanpicture'
require 'colorized_string'
class Guess < Hangmanpicture

  def initialize(gamename)
    super
    gamename.displayboard()
    puts ColorizedString["            The word has been chosen, guess a letter to get started!"].colorize(:color => :green, :mode => :underline)
    @guess = gets.chomp.to_s.strip
    gamename.addingletter(@guess) 
  end
end