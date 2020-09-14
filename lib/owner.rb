class Owner
  attr_reader :name, :species

  @@all = []
  @@count = 0

  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
    @@count += 1
    @cats = []
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
    Cat.all.collect {|x| x.owner == self}
  end




end