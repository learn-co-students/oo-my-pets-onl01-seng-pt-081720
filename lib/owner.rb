require 'pry'
class Owner
 attr_reader :name, :species, :say_species
 attr_accessor 
 @@all=[]
 def initialize(name, species = "human" , say_species = "I am a human.")
   @name = name
  @species = species
  @say_species = say_species
  @@all << self 
 end
 
 def self.all
   @@all 
 end
 def self.count 
   @@all.count
 end
 
 def self.reset_all
   @@all.clear
 end
 
 def cats
   Cat.all.select{ |cat| cat.owner == self}
 end
 
 def dogs
   Dog.all.select{ |dog| dog.owner == self}
 end
 
 def buy_cat(cat_name)
   Cat.new(cat_name,self)
 end
 
 def buy_dog(dog_name)
   Dog.new(dog_name,self)
 end
 
 def walk_dogs
   self.dogs.each{ |dog| dog.mood = "happy"}
 end
 def feed_cats
   self.cats.each{ |cat| cat.mood = "happy"}
 end
 
 def sell_pets
   self.cats.each{ |cat| cat.mood = "nervous"} && self.dogs.each{ |dog| dog.mood = "nervous"}
   self.cats.each{ |cat| cat.owner = nil} && self.dogs.each{ |dog| dog.owner = nil}
 end
 
 def list_pets
    "I have #{dogs.count} dog(s), and #{cats.count} cat(s)."
 end
end