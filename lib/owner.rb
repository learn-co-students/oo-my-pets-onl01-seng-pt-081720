require 'pry'
class Owner

  attr_reader :name, :species

  @@all = []

  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
  end

  def say_species
    "I am a #{@species}."
  end

  def self.all
    @@all
  end

  def self.count
    @@all.length
  end

  def self.reset_all
    @@all = []
  end

  def cats
    Cat.all.select { |cat| cat.owner == self}
  end

  def dogs
    Dog.all.select { |dog| dog.owner == self}
  end

  def buy_cat(name)
    name = Cat.new(name, self)
  end

  def buy_dog(name)
    name = Dog.new(name, self)
  end

  def walk_dogs
    Dog.all.collect { |dog| dog.mood = "happy" }
  end

  def feed_cats
    Cat.all.collect { |cat| cat.mood = "happy" }
  end

  def sell_pets
    Cat.all.collect do |cat|
      if cat.owner == self
        cat.owner = nil
        cat.mood = "nervous"
      end
    end
    Dog.all.collect do |dog|
      if dog.owner == self
        dog.owner = nil
        dog.mood = "nervous"
      end
    end
  end

  def list_pets
    dog_count = 0
    cat_count = 0
    Cat.all.collect do |cat|
      if cat.owner == self
        cat_count += 1
      end
    end
    Dog.all.collect do |dog|
      if dog.owner == self
        dog_count += 1
      end
    end
    "I have #{dog_count} dog(s), and #{cat_count} cat(s)."
  end


end
