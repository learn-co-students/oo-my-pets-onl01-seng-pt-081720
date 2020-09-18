class Dog
  # code goes here
  attr_accessor :owner, :mood
  attr_reader :name
  @@all = []

  def initialize(name, owner)
    @name = name
    @owner = owner
    save
  end

  def mood
    mood = @mood || "nervous"
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end
end
