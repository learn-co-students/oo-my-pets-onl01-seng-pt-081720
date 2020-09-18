
class Owner
  attr_reader :name , :species 
  attr_accessor :cats , :dogs 
  
  @@all = [] 
 
  def initialize(name)
    @name = name 
    @species = "human" 
    @@all << self 
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
  
 
end 