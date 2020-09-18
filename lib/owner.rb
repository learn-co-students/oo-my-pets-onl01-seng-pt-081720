class Owner
  # code goes here
  attr_reader :name, :species
  @@all = []


  def initialize(name)
    @name = name
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
end
