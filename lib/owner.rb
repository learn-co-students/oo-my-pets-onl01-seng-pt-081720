
class Owner
  attr_reader :name , :species 
  attr_accessor :cats , :dogs , :pets 
  
  @@all = [] 
    @@pets = {:dogs => [], :cats => []}
 
  def initialize(name)
    @name = name 
    @species = "human" 
    @@all << self 
      @cats = []
      @dogs =[]
  end 

def say_species 
  "I am a #{species}."
end 

def self.all 
  @@all 
end 

 def save   
   @@all << self 
 end 
 
 def self.count 
   @@all.length 
 end 
 
 def self.reset_all 
   @@all.clear 
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
    @cats << Cat.new(name, self)
  end

 def buy_dog(name)
    @dogs << Dog.new(name, self)
  end 
  
  def walk_dogs
        dogs.each do |dog|
          dog.mood = "happy"
        end
 end 
 
  def feed_cats 
        cats.each do |cat|
          cat.mood = "happy"
        end
 end 
 
 def sell_pets
    cats.each do |cat|
     cat.mood = "nervous"
     cat.owner = nil 
  end 
      dogs.each do |dog|
        dog.mood = "nervous"
        dog.owner = nil 
    end 
end 

  
  def list_pets
    "I have #{dogs.count} dog(s), and #{cats.count} cat(s)."
  end
 
 
end 