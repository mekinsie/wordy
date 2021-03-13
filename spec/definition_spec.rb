require 'rspec'
require 'definition'
require 'word'
require 'pry'

describe '#Definition' do
before(:each) do
  @word1 = Word.new("Hello", nil)
  @word1.save
  @word2 = Word.new("Goodbye", nil)
  @word2.save
end
after(:each) do
  Word.clear()
  Definition.clear()
end

  describe('.all') do
    it("should return an empty array when there are no definitions") do
      expect(Definition.all).to(eq([]))
    end
  end

  describe("#save") do
    it("saves a new definition to the database") do
      def1 = Definition.new("A greeting", @word1.id, nil)
      def1.save
      def2 = Definition.new("A farewell", @word2.id, nil)
      def2.save
      expect(Definition.all).to(eq([def1, def2]))
    end
  end

  describe('#==') do
    it("is the same definition if it has the same attributes as another definition") do
      def1 = Definition.new("A greeting", @word1.id, nil)
      def2 = Definition.new("A greeting", @word1.id, nil)
      expect(def1).to(eq(def2))
    end
  end

  describe('.clear') do
    it("clears all definitions from the database") do
      def1 = Definition.new("A greeting", @word1.id, nil)
      def1.save
      def2 = Definition.new("A farewell", @word2.id, nil)
      def2.save
      Definition.clear
      expect(Definition.all).to(eq([]))
    end
  end

  describe('.find') do
    it('should find a definition based on its id') do
      def1 = Definition.new("A greeting", @word1.id, nil)
      def1.save
      def2 = Definition.new("A farewell", @word2.id, nil)
      def2.save
      expect(Definition.find(def1.id)).to(eq(def1))
    end
  end

  describe('#update_def') do
  it("should update a definition") do
    def1 = Definition.new("A greeting", @word1.id, nil)
    def1.save
    def1.update_def("A farewell")
    expect(def1.definition).to(eq("A farewell"))
    end
  end

  describe("#delete") do
    it("should delete a definition by its id") do
      def1 = Definition.new("A greeting", @word1.id, nil)
      def1.save
      def2 = Definition.new("A farewell", @word2.id, nil)
      def2.save
      def1.delete
      expect(Definition.all).to(eq([def2]))
    end
  end

  describe('.find_by_word') do
    it("finds definitions for a word") do
      def1 = Definition.new("A greeting", @word1.id, nil)
      def1.save
      def2 = Definition.new("A farewell", @word2.id, nil)
      def2.save
      expect(Definition.find_by_word(@word2.id)).to(eq([def2]))
    end
  end

  describe('#word') do
    it("finds the word a definition belongs to") do
      def1 = Definition.new("A greeting", @word1.id, nil)
      def1.save
      expect(def1.word).to(eq(@word1))
    end
  end
end