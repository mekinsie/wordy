require 'rspec'
require 'word'
require 'definition'
require 'pry'

describe '#Word' do

before(:each) do
  Word.clear()
end

  describe('.all') do
    it("should return an empty array when there are no words") do
      expect(Word.all).to(eq([]))
    end
  end

  describe("#save") do
    it("saves a new word to the database") do
      word1 = Word.new("Hello", nil)
      word1.save
      word2 = Word.new("Goodbye", nil)
      word2.save
      expect(Word.all).to(eq([word1, word2]))
    end
  end

  describe('#==') do
    it("is the same word if it has the same attributes as another word") do
      word1 = Word.new("Hello", nil)
      word2 = Word.new("Hello", nil)
      expect(word1).to(eq(word2))
    end
  end

  describe('.clear') do
    it("clears all words from the database") do
      word1 = Word.new("Hello", nil)
      word1.save
      word2 = Word.new("Goodbye", nil)
      word2.save
      Word.clear
      expect(Word.all).to(eq([]))
    end
  end

  describe('.find') do
    it('should find a word based on its id') do
      word1 = Word.new("Hello", nil)
      word1.save
      expect(Word.find(word1.id)).to(eq(word1))
    end
  end

  describe('#update_word') do
    it("should update a word") do
      word1 = Word.new("Hello", nil)
      word1.save
      word1.update_word("Goodbye")
      expect(word1.word).to(eq("Goodbye"))
    end
  end


  describe("#delete") do
    it("should delete a word by its id") do
    word1 = Word.new("Hello", nil)
    word1.save
    word2 = Word.new("Goodbye", nil)
    word2.save
    word1.delete
    expect(Word.all).to(eq([word2]))
    end
  end
  
  describe('#definitions') do
    it("returns a word's definitions") do
      Definition.clear
      word1 = Word.new("Hello", nil)
      word1.save
      def1 = Definition.new("A greeting", word1.id, nil)
      def1.save
      def2 = Definition.new("Said at first meet", word1.id, nil)
      def2.save
      expect(word1.definitions).to(eq([def1, def2]))
    end
  end
end