class Owner
  # code goes here
  attr_reader :name, :species
  @@all = []

  def initialize(name)
    @name = name
    save
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

  def save
    @@all << self
  end

  def self.count
    @@all.count
  end

  def self.reset_all
    @@all.clear()
  end

  def cats
    Cats.all.select{|cat| cat.owner == self}
  end
end
