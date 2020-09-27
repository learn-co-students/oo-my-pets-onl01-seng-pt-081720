require 'pry'

class Owner
  attr_reader :name, :species

  @@all = []
  
  def initialize(name)
    @name = name
    @@all << self
  end

  def species
    species = "human"
  end

  def say_species
    # todo - fix this later
    "I am a human."
  end

  def self.all
    @@all
  end

  def self.count
    @@all.size
  end

  def self.reset_all
    @@all = []
  end

  def cats
    array_cats = []
    Cat.all.each do |pet_cat|
      if pet_cat.owner == self
        array_cats << pet_cat
      end
    end
    array_cats
  end

  def dogs
    array_dogs = []
    Dog.all.each do |pet_dog|
      if pet_dog.owner == self
        array_dogs << pet_dog
      end
    end
    array_dogs
  end

  def buy_cat(name)
    Cat.new(name, self)
  end

  def buy_dog(name)
    Dog.new(name, self)
  end

  def walk_dogs
    Dog.all.each do |pet_dog|
      pet_dog.mood = "happy"
    end
  end

  def feed_cats
    Cat.all.each do |pet_cat|
      pet_cat.mood = "happy"
    end
  end

  def sell_pets
    Dog.all.each do |pet_dog|
      pet_dog.mood = "nervous"
      pet_dog.owner = nil
    end
    Cat.all.each do |pet_cat|
      pet_cat.mood = "nervous"
      pet_cat.owner = nil
    end
  end

  def list_pets
    count_dogs = 0;
    count_cats = 0;

    Dog.all.each do |pet_dog|
      if pet_dog.owner = self
        count_dogs += 1
      end
    end

    Cat.all.each do |pet_cat|
      if pet_cat.owner = self
        count_cats += 1
      end
    end

    "I have #{count_dogs} dog(s), and #{count_cats} cat(s)."
  end

end