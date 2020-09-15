require 'pry'

class Owner
  attr_reader :name, :species #cannot change owner's name and species
  attr_accessor :cats # an owner has many cats: one-to-many relationship
  attr_accessor :dogs # an owner has many dogs: one-to-many relationship
  
  @@all = []
  
  def initialize(name) 
    @name = name
    @species = "human"
    @@all << self
    self.cats = []
    self.dogs = []
  end
  
  
  def say_species
    "I am a #{@species}."
  end
  
  
  def self.all 
    @@all
  end
  
   
   def self.count
    self.all.length
  end
  
  
  def self.reset_all 
    self.all.clear
  end
  
  def buy_cat(cat_name)
    
    cat = Cat.all.find {|cat| cat.name == cat_name}
    cat = Cat.new(cat_name, self) if cat.nil?
    
    cat.owner = self
    self.cats << cat
    self.cats.uniq!
  end
  
  def buy_dog(dog_name)
    
    dog = Dog.all.find {|dog| dog.name == dog_name}
    
    if dog # exists
      dog.owner = self
      self.dogs << dog
    else
      dog = Dog.new(dog_name, self)  
    end
    # self.dogs.uniq!
  end
  
    def walk_dogs
    dogs.each do |dog|
      dog.mood = "happy"
    end
  end
  
  def feed_cats
    cats.map { |cat| cat.mood = "happy"}
  end
  
  def sell_pets
    
    [self.cats, self.dogs].flatten.each do |pet|
      pet.mood = "nervous"
      pet.owner = nil
    end
    
    self.cats = []
    self.dogs = []
  end
  
  
  def list_pets
    return "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end
end