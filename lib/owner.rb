require 'pry'
class Owner
  # code goes here
  attr_reader :name, :species
  @@all = []
  
  def initialize(name )  
    @name = name
    @species = "human"
    save
  end
  
  def say_species         
    "I am a #{@species}."
  end
  
  def save  
    @@all << self
  end
  
  def self.all          
    @@all
  end
  
  def self.count         
    self.all.count
  end
  
  def self.reset_all    
    self.all.clear
  end
  
  def cats	      
    Cat.all.select do |cat|	     
    cat.owner == self	     
   end
    end
    
  def dogs
    Dog.all.select do |dog|	     
    dog.owner == self	     
  end
    end
    
  def buy_cat(name)
    Cat.new(name,self)
  end
  
  def buy_dog(name)
    Dog.new(name,self)
  end
  
  # iterate to change every dogs/cats mood
  def walk_dogs
   self.dogs.each {|dog| dog.mood = "happy"}
end
   
  def feed_cats
    self.cats.each {|cat| cat.mood = "happy"}
  end
  
  # how can i combine them?
  # change move to nervous when sold
  # pets have no owner after being sold (nil)
 
  def sell_pets
    pets = self.cats + self.dogs
    pets.each do |animal|
      animal.mood = "nervous"
      animal.owner = nil
  end
  end
  
  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end

  
 
  
  
  
end