require 'pry'

class Tamagotchi
  attr_reader :name, :food_level, :sleep_level, :activity_level, :birth, :food_time, :id

  @@nest = {}
  @@total_rows = 0

  def initialize(name, id)
    @name = name
    @food_level = 10
    @sleep_level = 10
    @activity_level = 10
    @birth = Time.now
    @food_time = Time.now
    @id = id || @@total_rows += 1
  end

  def ==(tama_to_compare)
    self.name() == tama_to_compare.name()
  end

  def save
    @@nest[self.id] = Tamagotchi.new(self.name, self.id)
  end

  def kill
    @@nest = {}
  end

  def feed
    self.food_level += 1
  end

  def self.all
    @@nest.values()
  end

  def is_alive
    @food_level > 0 ? true : false
  end

  # def set_sleep_level(number)

  # end

  def set_food_level(number)
      @food_level += number
      @food_time = Time.now
      @food_level
  end

  def time_passes(starting)
    ending = Time.now
    @elapsed = ((ending - starting) / 3600).floor
    @elapsed
  end

  def check_food_level
    if time_passes(@food_time) >= 1
    set_food_level(-(@elapsed))
    end
    @food_level
  end

end


