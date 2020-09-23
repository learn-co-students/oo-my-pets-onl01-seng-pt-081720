class Owner
attr_reader :name, :species
@@all = []

  def initialize (name)
    @name = name
    @species = "human"
    @@all << self
  end

  def say_species
    "I am a #{@species}."
  end

  def self.all
    @@all
  end

  def self.count
    @@all.length
  end

  def self.reset_all
    @@all.clear
  end

  def cats
    Cat.all.select do
      |c| c.owner == self
    end
  end

  def dogs
    Dog.all.select do
      |d| d.owner == self
    end
  end

  def buy_cat (cat)
    cat_1 = Cat.new(cat, self)
    cat
  end

  def buy_dog (dog)
    dog_1 = Dog.new(dog, self)
    dog
  end

  def feed_cats
    Cat.all.each do |cat|
      cat.mood = "happy"
    end
  end

  def walk_dogs
    Dog.all.each do |dog|
      dog.mood = "happy"
    end
  end

  def sell_pets
  self.cats.each do|c|
    c.owner = nil
    c.mood = "nervous"
    end
  self.dogs.each do|d|
    d.owner = nil
    d.mood = "nervous"
    end
  end

  def list_pets
    "I have #{self.dogs.size} dog(s), and #{self.cats.size} cat(s)."
  end
end
