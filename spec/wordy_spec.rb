require 'rspec'
require 'wordy'
require 'pry'

describe '#Word' do

  describe('.all') do
    it("should return an empty array when there are no words") do
      expect(Word.all).to(eq([]))
    end
  end

  describe("#save") do
    it("saves a new word to the database") do
      word1 = Word.new("Hello", "Used as a greeting.", nil)
      word1.save
      word2 = Word.new("Goodbye", "Used to express good wishes when parting.", nil)
      word2.save
      expect(Word.all).to(eq([word1, word2]))
    end
  end

  describe('#==') do
    it("is the same word if it has the same attributes as another word") do
      word1 = Word.new("Hello", "Used as a greeting.", nil)
      word2 = Word.new("Hello", "Used as a greeting.", nil)
      expect(word1).to(eq(word2))
    end
  end

end