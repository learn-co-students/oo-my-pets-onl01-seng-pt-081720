class Owner
  attr_reader :name, :species

  @@all = []

  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
  end
  
  def say_species
    "I am a #{@species}."
  end
  
  def self.all  # returns all instances created
    @@all
  end

  def self.count # returns the num of owners created
    self.all.count 
  end

  def self.reset_all #reset the owners created (clear)
    self.all.clear 
  end

  def cats
    Cat.all.select{ |cat| cat.owner == self }
  end

  def dogs
    Dog.all.select{ |dog| dog.owner == self }
  end

  def buy_cat(name) # knows about its cats
    Cat.new(name, self)
  end

  def buy_dog(name)  # knows about its dogs
    Dog.new(name, self)
  end

  def feed_cats # makes cats mood happy
    self.cats.each{ |cat| cat.mood = "happy" }
  end

  def walk_dogs # makes dogs mood happy
    self.dogs.each{ |dog| dog.mood = "happy" }
  end

  def sell_pets # makes pets nervous - ALL pets and leaves pets w/o owner
    pets = self.cats + self.dogs
    pets.each do |pet| # iteration had to be .each do | | to pass - && between .mood .owner only passed for owner, + failed completely
      pet.mood = "nervous"
      pet.owner = nil
    end
  end

  def list_pets # lists number of each pet
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end
end