require 'rspec'
require 'definition'
require 'wordy'
require 'pry'

describe '#Definition' do
before(:each) do
  Word.clear()
  Definition.clear()
  @word1 = Word.new("Hello", nil)
  @word1.save
  @word2 = Word.new("Goodbye", nil)
  @word2.save

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

end