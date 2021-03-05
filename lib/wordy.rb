require 'pry'

class Word
  # attribute_reader: 
  @@words = {}
  @@total_rows = 0
  def initialize
    @word = word
    @id = id || @@total_rows +=1
  end

  def self.all
    @@words.values
  end


end