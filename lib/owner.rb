require 'pry'
class Owner
  attr_reader :name, :species
  attr_accessor :mood 
  @@all = [] 
  
  def initialize(name)
    @name = name 
    @@all << self 
  end
  
   def species
     @species = "human"
   end
   
   def say_species 
      "I am a #{species}." 
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
     Cat.all.select {|cat| cat.owner == self} 
   end 
   
   def dogs 
     Dog.all.select {|dog| dog.owner == self}
   end
   
   def buy_cat(name)
    cat = Cat.new(name, self)
   end
   
   def buy_dog(name) 
     dog = Dog.new(name, self)
   end 
   
   def walk_dogs 
   walked_dogs = Dog.all.select {|dog| dog.owner == self}
    i = 0
     until i == walked_dogs.length 
      walked_dogs[i].mood = "happy"
      i += 1 
    end
   end
   
   def feed_cats 
     fed_cats = Cat.all.select {|cat| cat.owner == self} 
     i = 0 
      until i == fed_cats.length 
       fed_cats[i].mood = "happy"
       i += 1 
     end 
   end 
   
   def sell_pets
      nervous_cats = Cat.all.each do |cat| 
        if cat.owner == self 
           cat.mood = "nervous" 
           cat.owner = nil
        end 
      end
      nervous_dogs = Dog.all.each do |dog|
        if dog.owner == self 
          dog.mood = "nervous" 
          dog.owner = nil
        end 
      end
    end 
    
    def list_pets
       "I have #{self.dogs.length} dog(s), and #{self.cats.length} cat(s)."
    end 
    
    
end