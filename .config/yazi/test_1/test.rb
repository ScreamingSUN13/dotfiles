# Test script for syntax highlighting
def greet(name)
  "Hello, #{name}!"
end

class Animal
  attr_accessor :species
  def initialize(species)
    @species = species
  end
end

(1..5).each do |i|
  puts greet("World") if i.even?
end
