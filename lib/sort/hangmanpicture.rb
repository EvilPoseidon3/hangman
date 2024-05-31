
module Hang_the_man


  def wrong_guess_detector(guess)
    @wrongguess = @word.include?(guess)
      
      @hangman_array = ["|     O",["|    |","|    /|","|    /|\\"],"|     |",["|    /","|    / \\"]]
    if @wrongguess == false
      if @row3.length == "|"
      @row3 = @hangman_array[0]
      elsif @row4 != @hangman_array[1][2]
        @row4 = @hangman_array[1][0] unless @row4 == @hangman_array[1][0]
        @row4 = @hangman_array[1][1] unless @row4 == @hangman_array[1][1]
        @row4 = @hangman_array[1][2]
      elsif @row5 != @hangman_array[2][0]
        @row5 = @hangman_array[2][0]
      else @row6 != @hangman_array[3][1]
        @row6 = @hangman_array[3][0] unless @row6 == @hangman_array[3][0]
        @row = @hangman_array[3][1] 
      end
    end
end

class Hangmanpicture

  def initialize(wordguess)
    @word = wordguess
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
    for i in 0..wordguess.length - 1
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

  def checkletter(guess)
    #check to see if letter has been played already
    #compare if letter is in the wordrow or guessletter row
    @word.include?(guess.to_s) && @wordrow.join.include?(guess) != true && @guessletters.include?(guess) != true

    #depending on which is correct great a bullian variable to pass on

    #if letter is repeated return a string saying to choose a different letter

  end

  def addingletter(guess)
    #depending on bullian recived either add letter to word row or guessed letter row
    #if adding to wordrow make it corrispond with the position of letter in word
    if checkletter(guess) == true
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
    else 
      @message = "thats not a valid letter"
    end
      
  
      
    #if adding to guess letter row just push
  end


end

firstgame = Hangmanpicture.new("middling")
firstgame.displayboard
firstgame.addingletter("m")
firstgame.displayboard
firstgame.addingletter('d')
firstgame.displayboard
# puts firstgame.class