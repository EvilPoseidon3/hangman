require 'csv'


text_document_lines = File.readlines('google-10000-english-no-swears.txt')
word_array = Array.new
text_document_lines.each do |word|
  if word.strip.length.between?(5,12)
    word_array.push(word.strip)
  end
end
puts word_array
