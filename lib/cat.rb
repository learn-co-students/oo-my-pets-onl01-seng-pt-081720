class Cat
  attr_accessor :owner, :mood
  attr_reader :name 

  @@all = []
  
  def initialize(name, owner)
    @name = name
    self.owner = owner #put in separate method?
    @mood = "nervous"
    save
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

end