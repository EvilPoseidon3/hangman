require 'csv'
require 'colorized_string'
# require_relative 

require_relative('sort/guessalgo')
require_relative('sort/hangmanpicture')


text_document_lines = File.readlines('google-10000-english-no-swears.txt')

word_array = Array.new

text_document_lines.each do |word|
  if word.strip.length.between?(5,12)
    word_array.push(word.strip)
  end
end

def random_word_pick(word_array)
  return word_array[rand(0..word_array.length)]
end

def game_over_display(game)
  game.displayboard()
  puts ColorizedString["           Game Over"].colorize(:color => :light_red, :mode => :blink_slow)
  puts ColorizedString["      The word was #{game.word}"].colorize(:color => :red, :mode => :undeline)
  puts ColorizedString["        Thanks for Playing"].colorize(:color => :red, :mode => :blink_slow)

end

def game_won_display(game)
 game.displayboard()
 puts ColorizedString["           You won"].colorize(:color => :green, :mode => :blink_slow)
 puts ColorizedString["      The word was #{game.word}"].colorize(:color => :green, :mode => :blink_slow)
 puts ColorizedString["       Thanks for playing"].colorize(:color => :green, :mode => :blink_slow)
end
#create the game  on intitial run
inital_game = Hangmanpicture.new(random_word_pick(word_array))
#take that created game object and run it through a loop in the Guess class

while inital_game.gameover == false && inital_game.gamewon == false do 
  Guess.new(inital_game)
  if inital_game.gameover == true
  game_over_display(inital_game)
  elsif inital_game.gamewon == true
  game_won_display(inital_game)
  end
end
