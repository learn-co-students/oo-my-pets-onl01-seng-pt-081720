class Owner
  attr_reader :name, :species

  @@all_owners = []
  
  def initialize(name)
    @name = name
    @species = "human"
    @@all_owners << self
  end

    def say_species
      "I am a #{self.species}."
    end

    def self.all
      @@all_owners
    end

    def self.count
      self.all.length
    end

    def self.reset_all
      @@all_owners.clear
    end

    def cats
      Cat.all.select do |kitties|
        kitties.owner == self
      end
    end

    def dogs
      Dog.all.select do |doggies|
        doggies.owner == self
      end
    end

    def buy_cat(cat_name)
      Cat.new(cat_name, self)
    end

    def buy_dog(dog_name)
      Dog.new(dog_name, self)
    end

    def walk_dogs
      self.dogs.each do |dog|
        dog.mood = "happy"
      end
    end

    def walk_cats
      self.cats.each do |cat|
        cat.mood = "happy"
      end
    end

  def feed_cats
  self.cats.each do |cat|
    cat.mood = "happy"
    end
  end

  def sell_pets
    pets = self.cats.push(*self.dogs)

    pets.each do |pet|
      pet.mood = "nervous"
      pet.owner = nil
    end
  end

  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end

end