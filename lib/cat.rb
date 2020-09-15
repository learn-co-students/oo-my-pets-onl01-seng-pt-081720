class Cat
  attr_reader :name
  attr_accessor :mood
  attr_accessor :owner  
  
  @@all = []
  
    def initialize(name, owner)
    @name = name
    @owner = owner
    @mood = "nervous" 
    @@all << self
    self.owner.cats << self
  end
  
  def self.all 
    @@all
  end
  
end