require "pry"
class Owner
  # code goes here
  attr_reader :name, :species
  attr_accessor 
  
  @@all = []
  @@count = 0
  
  def initialize(name, species = "human")
    @name = name
    @species = species
    @@all << self 
    @@count += 1
  end
  
  def say_species
    "I am a #{@species}."
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
    #returns a collection of all the cats that belong to the owner
     Cat.all.select {|the_cat| the_cat.owner == self}
  end
  
  def dogs 
     Dog.all.select {|the_dog| the_dog.owner == self}
  end
  
  def buy_cat(name)
  #can buy a cat that is an instance of the Cat class
    new_cat = Cat.new(name, self)
      #knows about its cats
  end
  
  def buy_dog(name)
    new_dog = Dog.new(name, self)
  end
  
  def walk_dogs
    self.dogs.select {|pupper| pupper.mood = "happy"}
  end
  
  def feed_cats 
    self.cats.select {|kitty| kitty.mood = "happy"}
  end
  
  def sell_pets
    self.dogs.select {|pupper| pupper.mood = "nervous"}
    self.cats.select {|kitty| kitty.mood = "nervous"}
    
    self.dogs.select {|pupper| pupper.owner = nil}
    self.cats.select {|kitty| kitty.owner = nil}
  end
  
  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end
  
  
  
end