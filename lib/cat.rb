require 'pry'

class Cat
  # code goes here

  attr_reader :name, :mood
  attr_accessor :owner 

  @@all = []

  def initialize(name, owner)
    @name = name
    @owner = owner
    @mood = "nervous"
    @@all << self
  end

  def mood=(mood)
    @mood = mood
  end

  def self.all
    @@all
  end
  

end