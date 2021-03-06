class Definition
  attr_reader :definition, :id, :word_id
  @@definitions = {}
  @@total_rows = 0

  def initialize(definition, word_id, id)
    @definition = definition
    @word_id = word_id
    @id = id || @@total_rows +=1
  end

  def self.all
    @@definitions.values
  end
  
  def save
    @@definitions[self.id] = Definition.new(self.definition, self.word_id, self.id)
  end
  
  def ==(def_compare)
    self.definition() == def_compare.definition()
  end
  # def update_def(new_def)
  #   @definition = new_def
  # end
  

  # def self.clear
  #   @@words = {}
  #   @@total_rows = 0
  # end

  # def self.find(id)
  #   @@words[id]
  # end

  # def update_word(new_word)
  #   @word = new_word
  # end

  # def update_def(new_def)
  #   @definition = new_def
  # end
  
  # def delete
  #   @@words.delete(self.id)
  # end

end