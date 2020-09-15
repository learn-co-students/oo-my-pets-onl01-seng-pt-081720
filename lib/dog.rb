class Dog
  attr_accessor :owner, :mood
  attr_reader :name

  @@all = []

  def initialize(name, owner)
    @@all << self
    @name = name
    @owner = owner
    @mood = "nervous"
  end

  def mood
    @mood
  end

  def self.all
    @@all
  end
end