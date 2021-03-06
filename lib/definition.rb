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
  
  def self.find(id)
    @@definitions[id]
  end

  def self.clear
    @@definitions = {}
    @@total_rows = 0
  end

  def update_def(new_def)
    @definition = new_def
  end
  
  def delete
    @@definitions.delete(self.id)
  end

  def self.find_by_word(wordy_id)
    definitions = []
    @@definitions.values.each do |def_obj|
      if def_obj.word_id == wordy_id
        definitions.push(def_obj)
      end
    end
    definitions
  end

end