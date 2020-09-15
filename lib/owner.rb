require 'pry'
class Owner
  attr_reader :name, :species

  @@all = []
  @@count = 0

  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
    @@count += 1
    
  end

  def say_species
    return "I am a #{@species}."
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

  def cats
    Cat.all.select {|x|x.owner == self}
  end

  def dogs
    Dog.all.select {|x|x.owner == self}
  end

  def buy_cat(name)
    Cat.new(name, self)
  end

  def buy_dog(name)
    Dog.new(name, self)
  end

  def walk_dogs
    dogs.each do |x|
      x.mood = "happy"
    end
  end

  def feed_cats
    cats.each do |x|
      x.mood = "happy"
    end
  end

  def sell_pets
    cats.each do |x|
      x.mood = "nervous"
      x.owner = nil
    end

    dogs.each do |x|
      x.mood = "nervous"
      x.owner = nil
    end
  end

  def list_pets
    "I have #{dogs.count} dog(s), and #{cats.count} cat(s)."
  end

end