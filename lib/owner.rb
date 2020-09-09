class Owner
  @@all = []
  @@count = 0
  attr_reader :species, :name
  attr_accessor :cats, :dogs, :mood

  def initialize(name)
    @name = name
    @species = "human"
    @cats = []
    @dogs = []
    @@all << self
    @@count += 1
  end

  def cats
    Cat.all.select do |cat|
      cat.owner == self
    end
  end

  def walk_dogs
    happy = []
    Dog.all.select do |dog|
      if dog.owner == self
        happy << dog
      end
    end
    happy.each do |hap|
      hap.mood = "happy"
    end
  end

  def feed_cats
    happy = []
    Cat.all.select do |cat|
      if cat.owner == self
        happy << cat
      end
    end
    happy.each do |hap|
      hap.mood = "happy"
    end
  end

  def dogs
    Dog.all.select do |dog|
      dog.owner == self
    end
  end

  def buy_cat(name)
    @cats << Cat.new(name, self)
  end

  def buy_dog(name)
    @dogs << Dog.new(name, self)
  end

  def sell_pets
    dogs.each do |dog|
      dog.mood = "nervous"
      dog.owner = nil
    end
    cats.each do |cat|
      cat.mood = "nervous"
      cat.owner = nil
    end
  end

  def list_pets
    return "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end

  def say_species
     spe = "I am a #{self.species}."
     spe
  end

  def self.all
    @@all
  end

  def self.count
    @@count
  end

  def self.reset_all
    @@count = 0
  end
end
