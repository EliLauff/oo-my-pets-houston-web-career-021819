require_relative "./cat.rb"
require_relative "./dog.rb"
require_relative "./fish.rb"

class Owner
  attr_accessor :pets, :name
  attr_reader :species
  @@all = []

  def initialize(name)
    self.pets = {:fishes => [], :cats => [], :dogs => []}
    @species = "human"
    self.name = name
    @@all << self
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
    "I am a #{self.species}."
  end

  def buy_cat(name)
    new_cat = Cat.new(name)
    self.pets[:cats] << new_cat
  end

  def buy_fish(name)
    new_fish = Fish.new(name)
    self.pets[:fishes] << new_fish
  end

  def buy_dog(name)
    new_dog = Dog.new(name)
    self.pets[:dogs] << new_dog
  end

  def walk_dogs
    self.pets[:dogs].map do |dog|
      dog.mood = "happy"
    end
  end

  def play_with_cats
    self.pets[:cats].map do |introvert|
      introvert.mood = "happy"
    end
  end

  def feed_fish
    self.pets[:fishes].map do |fish|
      fish.mood = "happy"
    end
  end

  def sell_pets
    self.pets[:dogs].map do |dog|
      dog.mood = "nervous"
    end
    self.pets[:cats].map do |introvert|
      introvert.mood = "nervous"
    end
    self.pets[:fishes].map do |fish|
      fish.mood = "nervous"
    end
    self.pets = {:fishes => [], :cats => [], :dogs => []}
  end

  def list_pets
    "I have #{self.pets[:fishes].length} fish, #{self.pets[:dogs].length} dog(s), and #{self.pets[:cats].length} cat(s)."
  end
end