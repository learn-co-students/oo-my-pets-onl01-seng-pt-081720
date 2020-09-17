require 'pry'

class Owner

  attr_accessor
  attr_writer 
  attr_reader :name, :species

  @@all = []
  @@pets = {:cats => [], :dogs => []}

  #INSTANCE METHODS

  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
  end

  def say_species
    "I am a #{@species}."
  end

  #CLASS METHODS

  def self.all
    @@all
  end

  def self.count
    @@all.count
  end

  def self.reset_all
    @@all.clear
  end

  #OBJECT RELATIONSHIPS

  def cats
    Cat.all.select {|cat| cat.owner == self}
  end

  def dogs
    Dog.all.select {|dog| dog.owner == self}
  end 

  def buy_cat(cat)
    Cat.new(cat, self)
  end

  def buy_dog(dog)
    Dog.new(dog, self)
  end

  def walk_dogs
    self.dogs.each {|dog| dog.mood = "happy"} 
  end

  def feed_cats
    self.cats.each {|cat| cat.mood = "happy"}
  end

  def sell_pets
    self.dogs.each {|dog| dog.mood = "nervous"} && self.cats.each {|cat| cat.mood = "nervous"}
    self.dogs.each {|dog| dog.owner = nil} && self.cats.each {|cat| cat.owner = nil}
  end

  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end

end