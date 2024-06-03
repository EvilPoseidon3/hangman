require 'colorized_string'

module Hang_the_man


  def wrong_guess_detector(guess)
    @rightguess = @word.include?(guess)
      @hangman_array = ["|     O",["|     |","|    /|","|    /|\\"],"|     |",["|    /","|    / \\"]]
    if @rightguess == false
      if @row3 == "|"
        @row3 = @hangman_array[0]
      elsif @row4 != @hangman_array[1][2]
        if @row4 == "|"
          @row4 = @hangman_array[1][0] 
        elsif @row4 == @hangman_array[1][0]
          @row4 = @hangman_array[1][1] 
        elsif @row4 == @hangman_array[1][1]
          @row4 = @hangman_array[1][2]
        end
      elsif @row5 != @hangman_array[2]
        @row5 = @hangman_array[2]
      elsif @row6 != @hangman_array[3][1]
        if @row6 == "|"
          @row6 = @hangman_array[3][0] 
        elsif @row6 == @hangman_array[3][0]
          @row6 = @hangman_array[3][1] 
          @gameover = true
        end
      end
    end
  end
end

class Hangmanpicture

  include Hang_the_man
  attr_accessor :gameover

  def initialize(wordguess)
    @gameover = false
    @word = wordguess.to_s
    @title_row = " Hangman"
    @row1 =      "__________"
    @row2 =      "|     |"
    @row3 =      "|"
    @row4 =      "|"
    @row5 =      "|"
    @row6 =      "|"
    @row7 =      "|"
    @row8 =      "__________"
    @wordrow =   ["|"]
    @message = ''
    @guessletters = []
    for i in 0..@word.length - 1
      @wordrow.push(' |')
    end
    
    
  end


  def displayboard
    @board = [@title_row,@row1,@row2,@row3,@row4,@row5,@row6,@row7,@row8,@wordrow.join,@message]
    @board.each do |element|
      puts "            " + element
    end
    puts "Guessed letters: #{@guessletters.join(", ")}"
  end

# protected
  def valid_input?(guess) #see if the entry was a valid input
    guess.between?('a','z') && guess.length == 1
  end

  def checkletter?(guess) #see if letter has been played already

    @guessletters.include?(guess)


  end

  def addingletter(guess)
    #depending on bullian recived either add letter to word row or guessed letter row
    #if adding to wordrow make it corrispond with the position of letter in word
    if valid_input?(guess) == false
      puts "Thats not a valid answer please choose a single letter entry"
    elsif checkletter?(guess) == true
      puts "You've already guessed that letter, choose a different one"
    else
      wrong_guess_detector(guess)
      @all_index = Array.new
      @wordindexlength = @word.length - 1
      for i in 0..@wordindexlength do
        if @word[i] == guess
          @all_index.push(i)
        end
      end
      @message = "You got #{@all_index.length} letters correct"
      @guessletters.push(guess)
      @all_index.each {|index|
        @wordrow[index + 1].sub!(' ', guess)}
    
    end
      
  
      
    #if adding to guess letter row just push
  end


end

# firstgame = Hangmanpicture.new("middling")
# firstgame.displayboard
# firstgame.addingletter("m")
# firstgame.displayboard
# firstgame.addingletter('d')
# firstgame.displayboard
# puts firstgame.class