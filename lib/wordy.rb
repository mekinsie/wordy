require 'pry'

class Word
  attr_reader :word, :id
  @@words = {}
  @@total_rows = 0

  def initialize(word, id)
    @word = word
    @id = id || @@total_rows +=1
  end

  def self.all
    @@words.values
  end

  def save
    @@words[self.id] = Word.new(self.word, self.id)
  end

  def ==(word_compare)
    self.word() == word_compare.word()
  end

  def self.clear
    @@words = {}
    @@total_rows = 0
  end

  def self.find(id)
    @@words[id]
  end

  def update_word(new_word)
    @word = new_word
  end


  def delete
    @@words.delete(self.id)
  end

end