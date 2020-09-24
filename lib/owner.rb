class Owner
    attr_accessor :pets
    attr_reader :species, :name
  
    @@all = []
  
    def initialize(name)
      @name = name
      @species = "human"
      @@all << self
      @pets = {:cats => [], :dogs => []}
  
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
  
  def say_species
    "I am a #{species}."
  end
  
    def buy_cat(name)
      name = Cat.new(name, self)
      @pets[:cats] << name
    end
  
    def buy_dog(name)
      name = Dog.new(name, self)
      @pets[:dogs] << name
    end
  
    def walk_dogs
      Dog.all.each do |dog|
        dog.mood = "happy"
      end
    end
  
    def feed_cats
      Cat.all.each {|cat| cat.mood = "happy"}
    end
  
    def cats
      Cat.all.select {|cat| cat.owner == self}
    end
  
    def dogs
      Dog.all.select {|dog| dog.owner == self}
    end
  
  
    def sell_pets
      Cat.all.each do |sold|
        sold.mood = "nervous"
        sold.owner = nil
      end
  
      Dog.all.each do |sold|
        sold.mood = "nervous"
        sold.owner = nil
      end
  
    end
  
    def list_pets
  
      "I have #{@pets[:dogs].length} dog(s), and #{@pets[:cats].length} cat(s)."
    end
  
  
  end