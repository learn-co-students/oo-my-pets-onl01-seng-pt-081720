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
    Cat.all.select {|x|x.owner.name == @name}
  end

  def dogs
    dog_array = []
    dog_array = Dog.all.select {|x|x.owner.name == @name}
    dog_array.uniq
    binding.pry
  end

end